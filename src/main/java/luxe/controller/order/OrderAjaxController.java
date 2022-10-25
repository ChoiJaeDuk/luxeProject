package luxe.controller.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.AjaxController;
import luxe.service.order.OrderService;
import luxe.service.order.OrderServiceImpl;

public class OrderAjaxController implements AjaxController {
	OrderService service = new OrderServiceImpl();
	
	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void updateOrderByUserID(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		System.out.println("왔니 ?");
		response.setContentType("text/html;charset=UTF-8");
		String orderStatus = request.getParameter("orderStatus");
		String orderNo = request.getParameter("orderNo");
	
		service.updateOrderByOrderNo(orderNo, orderStatus);
		
	}

}
