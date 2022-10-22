package luxe.controller.sales;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.order.OrderDTO;
import luxe.service.sales.SalesService;
import luxe.service.sales.SalesServiceImpl;

public class SalesController implements Controller {
	SalesService service = new SalesServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView selectSale(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		OrderDTO order = service.selectSale();
		request.setAttribute("order", order);
		
		return new ModelAndView();
	}
	
	public ModelAndView selectSalesByMonth(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		List<OrderDTO> list = service.selectSalesByMonth();
		request.setAttribute("list", list);
		
		return new ModelAndView();
	}
	
	public ModelAndView selectBrandSalesByMonth(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		String brand = request.getParameter("brand");

		List<OrderDTO> list = service.selectBrandSalesByMonth(brand);
		request.setAttribute("list", list);
		
		return new ModelAndView();
	}
	
	public ModelAndView selectSalesRatesBrand(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		String brand = request.getParameter("brand");

		List<OrderDTO> list = service.selectBrandSalesByMonth(brand);
		request.setAttribute("list", list);
		
		return new ModelAndView();
	}

}
