package luxe.controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.order.OrderDTO;
import luxe.service.order.OrderService;
import luxe.service.order.OrderServiceImpl;

public class OrderController implements Controller {
	OrderService service = new OrderServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 주문 등록
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	/*public ModelAndView insertOrder(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		String orderNo = request.getParameter("orderNo");
		String sellNo = request.getParameter("sellNo");
		String bidNo = request.getParameter("bidNo");
		String orderPrice = request.getParameter("orderPrice");
		String orderDate = request.getParameter("orderDate");
		String orderStatus = request.getParameter("orderStatus");
		
		OrderDTO order = new OrderDTO(Integer.parseInt(orderNo), Integer.parseInt(sellNo), Integer.parseInt(bidNo),
										Integer.parseInt(orderPrice), orderDate, orderStatus);
		
		service.insertOrder(order);
		
		return new ModelAndView();

	}*/
	
	/**
	 * 주문내역 조회
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView selectOrder(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		List<OrderDTO> order = service.selectOrder();
		request.setAttribute("order", order);
		
		return new ModelAndView();
	}
	
	/**
	 * 회원별 주문내역 조회(구매자)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView selectOrderByUserIdForBuy(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		String buyerId = request.getParameter("buyerId");
		
		List<OrderDTO> buyerOrder = service.selectOrderByUserIdForBuy(buyerId);
		
		request.setAttribute("buyerOrder", buyerOrder);
		
		return new ModelAndView();
	}
	
	/**
	 * 회원별 주문내역 조회(판매자)
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView selectOrderByUserIdForSell(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		String sellerID = request.getParameter("sellerId");
		
		List<OrderDTO> sellerOrder = service.selectOrderByUserIdForSell(sellerID);
		
		request.setAttribute("sellerOrder", sellerOrder);
		
		return new ModelAndView();
	}
	
	 /***
	  * 회원별 주문상태 수정
	  * @param request
	  * @param response
	  * @return
	  * @throws Exception
	  */
	public ModelAndView updateOrderByUserID(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		String orderStatus = request.getParameter("orderStatus");
		String orderNo = request.getParameter("orderNo");
	
		service.updateOrderByOrderNo(orderNo, orderStatus);
		
		return new ModelAndView("front",true);
	}
	
	
	
}
