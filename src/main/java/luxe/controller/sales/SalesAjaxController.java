package luxe.controller.sales;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.AjaxController;
import luxe.dto.OrderDTO;
import luxe.service.sales.SalesService;
import luxe.service.sales.SalesServiceImpl;
import net.sf.json.JSONArray;

public class SalesAjaxController implements AjaxController {
	SalesService service = new SalesServiceImpl();
	
	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void selectSales(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");

	
		OrderDTO order = service.selectSale();
		
		PrintWriter out = response.getWriter();
		out.print(order);
		
	}
	
	public void selectSalesByMonth(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");

	
		List<OrderDTO> list = service.selectSalesByMonth();
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}
	
	public void selectBrandSalesByMonth(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");

		String brand = request.getParameter("brand");
		
		List<OrderDTO> list = service.selectBrandSalesByMonth(brand);
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}
	
	public void selectSalesRatesBrand(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");

		
		
		List<OrderDTO> list = service.selectSalesRateByBrand();
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}

}
