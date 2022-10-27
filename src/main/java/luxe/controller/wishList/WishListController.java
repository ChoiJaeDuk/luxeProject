package luxe.controller.wishList;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.WishListDTO;
import luxe.service.wishList.WishListService;
import luxe.service.wishList.WishListServiceImpl;

public class WishListController implements Controller{

	WishListService wishListService = new WishListServiceImpl();
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView deleteWishList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("id");
		System.out.println("연결되니?");
		int wishListNo = Integer.parseInt(request.getParameter("wishListNo"));
		wishListService.deleteWishList(wishListNo);
		
		return new ModelAndView("front", true);
	}
	
	
	public ModelAndView insertWishList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("id");
		System.out.println("위시리스트 나오니?");
		String userId = request.getParameter("userId");
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
		WishListDTO wishListDTO = new WishListDTO(userId, goodsNo);
		
		wishListService.insertWishList(wishListDTO);
		
		return new ModelAndView("front",true);
	}
	
	public ModelAndView selectWishState(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
//		HttpSession session = request.getSession();
//		String userId = (String)session.getAttribute("id");
		String userId = request.getParameter("userId");
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
		
		boolean wishState = wishListService.selectWishState(goodsNo, userId);
		
		request.setAttribute("wishState", wishState);
		
		return new ModelAndView("ProductDetails.jsp");
	}
}
