package luxe.controller.sell;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.dto.SellDTO;
import luxe.service.order.OrderService;
import luxe.service.order.OrderServiceImpl;
import luxe.service.sell.SellService;
import luxe.service.sell.SellServiceImpl;

public class SellAjaxController implements AjaxController {
	OrderService service = new OrderServiceImpl();
	SellService sellService = new SellServiceImpl();
	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void selectSellingInfoByUserId(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("id");
		
		List<SellDTO> sellingList = sellService.selectSellingInfoByUserId(userId);
		
		PrintWriter out = response.getWriter();
		out.print(sellingList);
		
	}

}
