package luxe.controller.sell;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.controller.ModelAndView;
import luxe.dto.SellDTO;
import luxe.service.order.OrderService;
import luxe.service.order.OrderServiceImpl;
import luxe.service.sell.SellService;
import luxe.service.sell.SellServiceImpl;
import net.sf.json.JSONArray;

public class SellAjaxController implements AjaxController {
	OrderService service = new OrderServiceImpl();
	SellService sellService = new SellServiceImpl();
	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void selectSellAll(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		
		List<SellDTO> list = sellService.selectSellAll();
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}
	
	public void selectSellingInfoByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		//String userId = request.getParameter("id");
		List<SellDTO> sellingList = sellService.selectSellingInfoByUserId(userId);
		JSONArray arr = JSONArray.fromObject(sellingList);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}

	
	public void selectSellWaitInfoByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		//String userId = request.getParameter("id");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		List<SellDTO> sellWaitList = sellService.selectSellWaitInfoByUserId(userId);
		System.out.println(sellWaitList.size());
		JSONArray arr = JSONArray.fromObject(sellWaitList);
		PrintWriter out = response.getWriter();
		out.print(arr);
	}
	
	
	public void updateSellPrice(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		int updateSellPrice = Integer.parseInt(request.getParameter("sellPrice"));
		//String sellUserId = request.getParameter("userId");	
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		SellDTO sellDTO = new SellDTO(sellNo, updateSellPrice, userId);
		sellService.updateSellPrice(sellDTO);//sellUserId, sellNo, updateSellPrice
	}
	
	public void deleteSell(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		System.out.println("sellNo = " +  sellNo);
		sellService.deleteSell(sellNo);
	}
	
	
	public void sellDuplicateCheck(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String serialNumber = request.getParameter("serialNumber");
		SellDTO sellDTO = new SellDTO(userId, serialNumber);
		
		boolean result = sellService.sellDuplicateCheck(sellDTO);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	public void updateSellStatus(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		String sellStatus = request.getParameter("sellStatus");
		int sellPrice = Integer.parseInt(request.getParameter("sellPrice"));
		SellDTO sellDTO = new SellDTO(sellNo, userId, sellStatus, sellPrice);
		int result = sellService.updateSellStatus(sellDTO);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
