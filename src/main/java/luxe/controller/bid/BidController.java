package luxe.controller.bid;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.BidDTO;
import luxe.service.bid.BidService;
import luxe.service.bid.BidServiceImpl;

public class BidController implements Controller {
	private BidService bidService = new BidServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return null;
	}

	/**
	 * 관리자 - 전체 입찰 조회
	 */
	public ModelAndView selectAllBid(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<BidDTO> list = bidService.selectAllBid();
		request.setAttribute("bidList", list);
		return new ModelAndView("조회페이지");
	}

	/**
	 * 회원 - 입찰 상태별 조회
	 */
	public ModelAndView selectAllBidByUserId(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String bidStatus = request.getParameter("bidStatus");

		List<BidDTO> list = bidService.selectAllBidByUserId(userId, bidStatus);

		request.setAttribute("bidUserList", list);
		System.out.println(list.size());

		return new ModelAndView("mypage.jsp");
	}

	/**
	 * 입찰 내역 중복 확인
	 */
	public ModelAndView checkDuplicatedBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String goodsNostr = request.getParameter("goodsNo");
		BidDTO bid = bidService.checkDuplicatedBid(new BidDTO(0, Integer.parseInt(goodsNostr), userId, 0, null, null));
		request.setAttribute("bidhistory", bid);

		return new ModelAndView("조회페이지");

	}

	/**
	 * 입찰 등록
	 * 
	 * @throws SQLException
	 * @throws NumberFormatException
	 */
	public ModelAndView insertBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String goodsNostr = request.getParameter("goodsNo");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String bidPrice = request.getParameter("bidPrice");

		bidService.insertBid(new BidDTO(0, Integer.parseInt(goodsNostr), userId, Integer.parseInt(bidPrice), null, null));

		return new ModelAndView("success/success.jsp", true);
	}

	/**
	 * 상품 번호 해당 입찰 최고가 조회
	 */
	public ModelAndView getHighestBidPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String goodsNostr = request.getParameter("goodsNo");

		BidDTO highestBid = bidService.getHighestBidPrice(Integer.parseInt(goodsNostr));
		request.setAttribute("highestBid", highestBid);

		return new ModelAndView("조회페이지");
	}

	/**
	 * 입찰 가격 수정
	 */
	public ModelAndView updateBidPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String bidNoStr = request.getParameter("bidNo");
		String goodsNostr = request.getParameter("goodsNo");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String bidPrice = request.getParameter("bidPrice");

		bidService.updateBidPrice(new BidDTO(Integer.parseInt(bidNoStr), Integer.parseInt(goodsNostr), userId,
				Integer.parseInt(bidPrice), null, null));

		return new ModelAndView("조회페이지", true);
	}

	/**
	 * 입찰 상태 수정 - front에서 부를 일이 있는지...?
	 */
	public ModelAndView updateBidStatus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bidNo = request.getParameter("bidNo");

		bidService.updateBidStatus(Integer.parseInt(bidNo));

		return new ModelAndView("조회페이지", true);
	}

	/**
	 * 입찰 삭제
	 */
	public ModelAndView deleteBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bidNoStr = request.getParameter("bidNo");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		bidService.deleteBid(Integer.parseInt(bidNoStr), userId);

		return new ModelAndView("조회페이지", false);
	}

}
