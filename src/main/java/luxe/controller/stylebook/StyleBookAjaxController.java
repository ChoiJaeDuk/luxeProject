package luxe.controller.stylebook;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.AjaxController;
import luxe.controller.ModelAndView;
import luxe.dto.StyleBookDTO;
import luxe.service.stylebook.StyleBookService;
import luxe.service.stylebook.StyleBookServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class StyleBookAjaxController implements AjaxController {
	private StyleBookService styleBookService = new StyleBookServiceImpl();

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * 스타일북 조회
	 */

	public void selectAllStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String brand = request.getParameter("brand");
		String goodsNoStr = request.getParameter("goodsNo");
		int goodsNo = 0;
		String sortCondition = request.getParameter("sortCondition");

		if (goodsNoStr != null) {
			goodsNo = Integer.parseInt(goodsNoStr);
		}
		List<StyleBookDTO> styleBookList = styleBookService.selectAllStyleBook(brand, goodsNo, sortCondition);
		JSONArray arr = JSONArray.fromObject(styleBookList);

		PrintWriter out = response.getWriter();
		out.print(arr);

	}

	/**
	 * 상품 번호에 해당하는 게시물 조회 - 좋아요 기준으로 최대 3개까지 조회
	 */
	public void selectStyleBookByGoodsNo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String goodsNo = request.getParameter("goodsNo");

		List<StyleBookDTO> list = styleBookService.selectStyleBookByGoodsNo(Integer.parseInt(goodsNo));
		JSONArray arr = JSONArray.fromObject(list);

		PrintWriter out = response.getWriter();
		out.print(arr);
	}

	/**
	 * 스타일북 상세조회
	 */
	public void selectStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String boardRegNoStr = request.getParameter("boardRegNo");
		boolean state = request.getParameter("flag") == null ? true : false;

		int boardRegNo = 0;
		if (boardRegNoStr != null)
			boardRegNo = Integer.parseInt(boardRegNoStr);
		StyleBookDTO styleBook = styleBookService.selectStyleBookByBoardRegNo(boardRegNo, state);

		JSONObject obj = JSONObject.fromObject(styleBook);

		PrintWriter out = response.getWriter();
		out.print(obj);
	}
	
	/**
	 * 스타일북 좋아요
	 */

	public void increaseStyleBookLikeNo(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String boardRegNoStr = request.getParameter("boardRegNo");
		int boardRegNo = 0;
		if (boardRegNoStr != null)
			boardRegNo = Integer.parseInt(boardRegNoStr);
		styleBookService.increaseStyleBookLikeNo(boardRegNo);

		PrintWriter out = response.getWriter();
		out.print("성공");
	}

	/**
	 * 게시물 삭제
	 */
	public void deleteStyleBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String boardRegNoStr = request.getParameter("boardRegNo");
		int boardRegNo = Integer.parseInt(boardRegNoStr);

		String saveDir = request.getServletContext().getRealPath("/stylebook");
		styleBookService.deleteStyleBook(boardRegNo, saveDir);

		PrintWriter out = response.getWriter();
		out.print("성공");
	}

}
