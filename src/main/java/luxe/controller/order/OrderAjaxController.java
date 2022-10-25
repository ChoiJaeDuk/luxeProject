package luxe.controller.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.controller.ModelAndView;
import luxe.dto.OrderDTO;
import luxe.service.order.OrderService;
import luxe.service.order.OrderServiceImpl;
import net.sf.json.JSONArray;

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
		System.out.println(orderStatus);
		String orderNo = request.getParameter("orderNo");
		System.out.println(orderNo);
	
		int result = service.updateOrderByOrderNo(orderNo, orderStatus);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}
	
	public void selectOrderByUserIdForBuy(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session =  request.getSession();
		String buyerId = (String)session.getAttribute("userId");
	
		List<OrderDTO> buyerOrder = service.selectOrderByUserIdForBuy(buyerId);
		
		JSONArray arr = JSONArray.fromObject(buyerOrder);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}

}
