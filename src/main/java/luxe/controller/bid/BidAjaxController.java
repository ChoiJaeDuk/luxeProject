package luxe.controller.bid;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.BidDTO;
import luxe.service.bid.BidService;
import luxe.service.bid.BidServiceImpl;
import net.sf.json.JSONArray;

public class BidAjaxController implements AjaxController {
	BidService bidService = new BidServiceImpl();

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * 관리자 - 전체 입찰 조회
	 */
	public void selectAllBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		List<BidDTO> list = bidService.selectAllBid();
		JSONArray arr = JSONArray.fromObject(list);

		PrintWriter out = response.getWriter();
		out.print(arr);

	}

	/**
	 * 회원 - 입찰 상태별 조회
	 */
	public void selectAllBidByUserId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String bidStatus = request.getParameter("bidStatus");

		List<BidDTO> list = bidService.selectAllBidByUserId(userId, bidStatus);
		JSONArray arr = JSONArray.fromObject(list);

		PrintWriter out = response.getWriter();
		out.print(arr);
	}

	/**
	 * 입찰 가격 수정
	 */
	public void updateBidPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		String bidNoStr = request.getParameter("bidNo");
		String goodsNostr = request.getParameter("goodsNo");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String bidPrice = request.getParameter("bidPrice");
		System.out.println(bidPrice);
		

		int result= bidService.updateBidPrice(new BidDTO(Integer.parseInt(bidNoStr), Integer.parseInt(goodsNostr), userId,
				Integer.parseInt(bidPrice), null, null));
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	/**
	 * 입찰 삭제
	 */
	public void deleteBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		String bidNostr = request.getParameter("bidNo");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		bidService.deleteBid(Integer.parseInt(bidNostr), userId);

		PrintWriter out = response.getWriter();
		out.print("삭제성공");
	}

}
