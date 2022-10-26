package luxe.controller.wishList;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.AjaxController;
import luxe.dto.GoodsDTO;
import luxe.service.wishList.WishListService;
import luxe.service.wishList.WishListServiceImpl;
import net.sf.json.JSONArray;

public class WishListAjaxController implements AjaxController{
	WishListService wishListService = new WishListServiceImpl();
	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	
	public void selectWishList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("id");
		System.out.println("연결되니?");
		String userId = request.getParameter("id");
		List<GoodsDTO> wishList = wishListService.selectWishList(userId);
		JSONArray arr = JSONArray.fromObject(wishList);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
		
	}
	
	public void deleteWishList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("id");
		System.out.println("연결되니?");
		int wishListNo = Integer.parseInt(request.getParameter("wishListNo"));
		wishListService.deleteWishList(wishListNo);
		
//		PrintWriter out = response.getWriter();
//		out.print(arr);
	}

}
