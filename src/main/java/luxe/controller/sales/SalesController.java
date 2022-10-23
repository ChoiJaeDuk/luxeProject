package luxe.controller.sales;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.OrderDTO;
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
	
	/***
	 * 매출조회
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView selectSales(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		OrderDTO orderSales = service.selectSale();
		request.setAttribute("orderSales", orderSales);
		
		return new ModelAndView("jieunTest.jsp");
	}
	
	/***
	 * 월별 매출 , 수익
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView selectSalesByMonth(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		List<OrderDTO> list = service.selectSalesByMonth();
		request.setAttribute("list", list);
		
		return new ModelAndView();
	}
	
	/***
	 * 브랜드별 월별 매출
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView selectBrandSalesByMonth(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		String brand = request.getParameter("brand");

		List<OrderDTO> list = service.selectBrandSalesByMonth(brand);
		request.setAttribute("list", list);
		
		return new ModelAndView();
	}
	
	/***
	 * 브랜드별 판매량
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ModelAndView selectSalesRatesBrand(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		String brand = request.getParameter("brand");

		List<OrderDTO> list = service.selectBrandSalesByMonth(brand);
		request.setAttribute("list", list);
		
		return new ModelAndView();
	}

}
