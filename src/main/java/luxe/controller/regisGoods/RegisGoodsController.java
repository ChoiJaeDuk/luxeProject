package luxe.controller.regisGoods;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.RegisGoodsDTO;
import luxe.service.regisGoods.RegisGoodsService;
import luxe.service.regisGoods.RegisGoodsServiceImpl;

public class RegisGoodsController implements Controller {

	private RegisGoodsService regisGoodsService = new RegisGoodsServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 신규상품문의 등록 
	 */
	public ModelAndView insertRegisGoods(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		int regisGoodsNo = Integer.parseInt(request.getParameter("regisGoodsNo"));
		String userId = request.getParameter("userId");
		String regisGoodsBrand = request.getParameter("regisGoodsBrand");
		String regisGoodsName = request.getParameter("regisGoodsName");
		String regisDate = request.getParameter("regisDate");

		RegisGoodsDTO regisGoodsDTO = new RegisGoodsDTO(regisGoodsNo, userId, regisGoodsBrand, regisGoodsName,
				regisDate);

		regisGoodsService.insertRegisGoods(regisGoodsDTO);

		return new ModelAndView("/front", true);
	}

	/**
	 * 신규상품등록문의 전체 조회
	 */
	public ModelAndView selectAllRegisGoods(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		List<RegisGoodsDTO> list = regisGoodsService.selectAllRegisGoods();
		request.setAttribute("list", list);

		return new ModelAndView("/fornt", true);
	}
}
