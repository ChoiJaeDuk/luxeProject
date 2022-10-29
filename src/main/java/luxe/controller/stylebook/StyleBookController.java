package luxe.controller.stylebook;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.StyleBookDTO;
import luxe.service.stylebook.StyleBookService;
import luxe.service.stylebook.StyleBookServiceImpl;

public class StyleBookController implements Controller {
	private StyleBookService styleBookService = new StyleBookServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return null;
	}

	/**
	 * 스타일북 조회
	 * 
	 * @throws SQLException
	 */

	public ModelAndView selectAllStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String brand = request.getParameter("brand");
		String goodsNoStr = request.getParameter("goodsNo");
		int goodsNo = 0;
		String sortCondition = request.getParameter("sortCondition");

		if (goodsNoStr != null) {
			goodsNo = Integer.parseInt(goodsNoStr);
		}
		List<StyleBookDTO> styleBookList = styleBookService.selectAllStyleBook(brand, goodsNo, sortCondition);
		request.setAttribute("styleBookList", styleBookList);

		// 조회 페이지 이동
		return new ModelAndView("front");
	}

	/**
	 * 상품 번호에 해당하는 게시물 조회 - 좋아요 기준으로 최대 3개까지 조회
	 */
	public ModelAndView selectStyleBookByGoodsNo(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String goodsNo = request.getParameter("goodsNo");

		List<StyleBookDTO> list = styleBookService.selectStyleBookByGoodsNo(Integer.parseInt(goodsNo));

		request.setAttribute("styleBookList", list);

		// 조회 페이지
		return new ModelAndView("front");
	}

	/**
	 * 스타일북 상세조회
	 */
	public ModelAndView selectStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String boardRegNoStr = request.getParameter("boardRegNo");
		boolean state = request.getParameter("flag") == null ? true : false;

		int boardRegNo = 0;
		if (boardRegNoStr != null)
			boardRegNo = Integer.parseInt(boardRegNoStr);
		StyleBookDTO styleBook = styleBookService.selectStyleBookByBoardRegNo(boardRegNo, state);

		request.setAttribute("styleBook", styleBook);

		// 조회 페이지
		return new ModelAndView("front");
	}

	/**
	 * 스타일북 좋아요
	 */

	public ModelAndView increaseStyleBookLikeNo(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String boardRegNoStr = request.getParameter("boardRegNo");
		int boardRegNo = 0;
		if (boardRegNoStr != null)
			boardRegNo = Integer.parseInt(boardRegNoStr);
		styleBookService.increaseStyleBookLikeNo(boardRegNo);

		// 이후 ajax 처리할 것
		return new ModelAndView("front", true);
	}

	/**
	 * 스타일북 등록
	 */
	public ModelAndView insertStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getServletContext().getRealPath("/stylebook"); //

		int maxSize = 1024 * 1024 * 100; // 100M
		String encoding = "UTF-8";

		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());

		// 전송된 데이터 받기
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId"); // 로그인된 유저

		String goodsNo = m.getParameter("goodsNo");
		String boardContent = m.getParameter("boardContent");
		String description = m.getParameter("description");

		StyleBookDTO styleBook = new StyleBookDTO(0, userId, Integer.parseInt(goodsNo), boardContent, null, null, 0, 0);

		// 만약, 파일첨부가 되었다면....
		if (m.getFilesystemName("styleBookImage") != null) {
			// 파일이름저장
			styleBook.setfName(m.getFilesystemName("styleBookImage"));
		}

		styleBookService.insertStyleBook(styleBook);

		return new ModelAndView("front", true);
	}

	/**
	 * 스타일북 삭제
	 */
	public ModelAndView deleteStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String boardRegNoStr = request.getParameter("boardRegNo");
		int boardRegNo = Integer.parseInt(boardRegNoStr);

		String saveDir = request.getServletContext().getRealPath("/stylebook");
		styleBookService.deleteStyleBook(boardRegNo, saveDir);

		return new ModelAndView("front", true);
	}

	/**
	 * 스타일북 수정
	 */

	public ModelAndView updateStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String boardRegNoStr = request.getParameter("boardRegNo");
		int boardRegNo = Integer.parseInt(boardRegNoStr);
		String boardContent = request.getParameter("boardContent");

		StyleBookDTO styleBook = new StyleBookDTO(boardRegNo, null, 0, boardContent, null, null, 0, 0);
		styleBookService.updateStyleBook(styleBook);

		return new ModelAndView("style/StyleBoard_jojo.jsp", true);
	}
}
