package luxe.controller.sell;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Mmap;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.SellDTO;
import luxe.service.sell.SellService;
import luxe.service.sell.SellServiceImpl;

public class SellController implements Controller {

	private SellService sellService = new SellServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView insertSell(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
		String userId = request.getParameter("userId");
		String accountNo = request.getParameter("accountNo");
		int sellPrice = Integer.parseInt(request.getParameter("sellPrice"));
		String purDate = request.getParameter("purDate");
		String serialNumber = request.getParameter("serialNumber");
		
		sellService.insertSell(new SellDTO(goodsNo, userId, accountNo, sellPrice, purDate, serialNumber));
		
		return new ModelAndView("/front",true);
	}	
	
	
	public ModelAndView updateSellPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		int updateSellPrice = Integer.parseInt(request.getParameter("sellPrice"));
		String sellUserId = request.getParameter("userId");	
		SellDTO sellDTO = new SellDTO(sellNo, updateSellPrice, sellUserId);
		sellService.updateSellPrice(sellDTO);//sellUserId, sellNo, updateSellPrice
		
		return new ModelAndView("/front",true);
	}
	
	
	
	
	public ModelAndView updateSellStatus(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int sellNo = Integer.parseInt(request.getParameter("sellNo"));
		String sellStatus = request.getParameter("sellStatus");
		String sellUserId = request.getParameter("sellUserId");	
		int sellPrice = Integer.parseInt(request.getParameter("sellPrice"));
		SellDTO sellDTO = new SellDTO(sellNo, sellUserId, sellStatus, sellPrice);
		sellService.updateSellStatus(sellDTO);
		
		return new ModelAndView("/front",true);
	}
	
	
	public ModelAndView selectSellAll(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<SellDTO> sellAllList = sellService.selectSellAll();
		
		request.setAttribute("sellAllList", sellAllList);
		
		return new ModelAndView("test2.jsp");
	}
	
	public ModelAndView selectSellingInfoByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userId = request.getParameter("id");
		
		List<SellDTO> sellingList = sellService.selectSellingInfoByUserId(userId);
		
		request.setAttribute("sellingList", sellingList);
		
		return new ModelAndView("test2.jsp");
	}
	
	public ModelAndView selectSellWaitInfoByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userId = request.getParameter(null);
		
		List<SellDTO> sellWaitList = sellService.selectSellingInfoByUserId(userId);
		
		request.setAttribute("sellWaitList", sellWaitList);
		
		return new ModelAndView("duckTest.jsp");
	}
	
	public ModelAndView selectMaxPriceByGoodsNo(HttpServletRequest request, HttpServletResponse respone) throws Exception{
		//int goodsNo = Integer.parseInt(request.getParameter("goods"));
		
		SellDTO sellDTO = sellService.selectMaxPriceByGoodsNo(1);
		int lowestPrice = sellDTO.getSellPrice(); 
		request.setAttribute("lowestPrice", lowestPrice);
		
		return new ModelAndView("duckTest.jsp");
	}
	
	public ModelAndView sellDuplicateCheck(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String serialNumber = request.getParameter(null);
		
		boolean result = sellService.sellDuplicateCheck(null);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("");
	}
}
