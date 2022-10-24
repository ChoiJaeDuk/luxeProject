package luxe.controller.sell;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		int goodsNo = Integer.parseInt(request.getParameter(null));
		String userId = request.getParameter(null);
		String accountNo = request.getParameter(null);
		int sellPrice = Integer.parseInt(request.getParameter(null));
		String purDate = request.getParameter(null);
		String serialNumber = request.getParameter(null);
		
		sellService.insertSell(new SellDTO(goodsNo, userId, accountNo, sellPrice, purDate, serialNumber));
		
		return new ModelAndView("/front",true);
	}	
	
	
	public ModelAndView updateSellPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int sellNo = Integer.parseInt(request.getParameter(null));
		int updateSellPrice = Integer.parseInt(request.getParameter(null));
		String sellUserId = request.getParameter("sellUserId");	
		sellService.updateSellPrice(sellUserId, sellNo, updateSellPrice);
		
		return new ModelAndView("/front",true);
	}
	
	
	
	
	public ModelAndView updateSellStatus(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int sellNo = Integer.parseInt(request.getParameter(null));
		String sellStatus = request.getParameter(null);
		String sellUserId = request.getParameter("sellUserId");	
		
		sellService.updateSellStatus(sellUserId, sellNo, sellStatus);
		
		return new ModelAndView("/front",true);
	}
	
	
	public ModelAndView selectSellingInfoByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userId = request.getParameter(null);
		
		List<SellDTO> sellingList = sellService.selectSellingInfoByUserId(userId);
		
		request.setAttribute("sellingList", sellingList);
		
		return new ModelAndView("duckTest.jsp");
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
