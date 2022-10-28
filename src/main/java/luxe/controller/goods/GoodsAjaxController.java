package luxe.controller.goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.controller.ModelAndView;
import luxe.dto.GoodsDTO;
import luxe.service.goods.GoodsService;
import luxe.service.goods.GoodsServiceImpl;
import net.sf.json.JSONArray;

public class GoodsAjaxController implements AjaxController {
	private GoodsService goodsService = new GoodsServiceImpl();
	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void selectAllGoods(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		String brand = request.getParameter("brand");
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");
		String userId =request.getParameter("userId");
		System.out.println("brand = " + brand);
		System.out.println("category = " + category);
		System.out.println("sort = " + sort);
		
		
		//로그인 여부 판단
		/*
		 * HttpSession session=request.getSession();
		 * 
		 * String userId=null; if(session.getAttribute("userId")!=null) { userId =
		 * (String)session.getAttribute("userId"); }
		 */
		List<GoodsDTO> list = goodsService.selectAllGoods(brand, category, sort, userId);
		
		
		System.out.println(list.size());
		JSONArray arr = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}
	

}
