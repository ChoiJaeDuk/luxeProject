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
	
	public void selectSellingInfoByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("id");
	
		String userId = request.getParameter("id");
		List<SellDTO> sellingList = sellService.selectSellingInfoByUserId(userId);
		JSONArray arr = JSONArray.fromObject(sellingList);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}

	
	public void selectSellWaitInfoByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		String userId = request.getParameter("id");
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("id");
		List<SellDTO> sellWaitList = sellService.selectSellWaitInfoByUserId(userId);
		System.out.println(sellWaitList.size());
		JSONArray arr = JSONArray.fromObject(sellWaitList);
		PrintWriter out = response.getWriter();
		out.print(arr);
	}
	
	
	public void updateSellPrice(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		int updateSellPrice = Integer.parseInt(request.getParameter("sellPrice"));
		String sellUserId = request.getParameter("userId");	
	
		SellDTO sellDTO = new SellDTO(sellNo, updateSellPrice, sellUserId);
		sellService.updateSellPrice(sellDTO);//sellUserId, sellNo, updateSellPrice
	}
	
	public void deleteSell(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		System.out.println("sellNo = " +  sellNo);
		sellService.deleteSell(sellNo);
	}
}
