package luxe.controller.goods;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.GoodsDTO;
import luxe.dto.GoodsImagesDTO;
import luxe.service.goods.GoodsService;
import luxe.service.goods.GoodsServiceImpl;

public class GoodsController implements Controller {

	private GoodsService goodsService = new GoodsServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return null;
	}

	/**
	 * 상품등록
	 */
	public ModelAndView insertGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String saveDir = request.getRealPath("/goodsImg");
		int maxSize = 1024 * 1024 * 100; // 100M
		String encoding = "UTF-8";

		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());

		String brand = m.getParameter("brand");
		String category = m.getParameter("category");
		String goodsName = m.getParameter("goodsName");
		String goodsNameKor = m.getParameter("goodsNameKor");
		String goodsModelNo = m.getParameter("goodsModelNo");
		String goodsReleaseDate = m.getParameter("goodsReleaseDate");
		int goodsReleasePrice = Integer.parseInt(m.getParameter("goodsReleasePrice"));
		System.out.println(goodsReleaseDate);
		String goodsMainImg = m.getFilesystemName("goodsMainImg");
		System.out.println(goodsMainImg);
		String goodsImg1 = m.getFilesystemName("goodsImg1");
		String goodsImg2 = m.getFilesystemName("goodsImg2");
		String goodsImg3 = m.getFilesystemName("goodsImg3");
		String goodsImg4 = m.getFilesystemName("goodsImg4");
	

		
		GoodsDTO goodsDTO = new GoodsDTO(brand, category, goodsName, goodsNameKor, goodsModelNo, goodsReleaseDate,
				goodsReleasePrice);

		GoodsImagesDTO goodsImagesDTO = new GoodsImagesDTO(goodsMainImg, goodsImg1, goodsImg2, goodsImg3, goodsImg4);

		goodsService.insertGoods(goodsDTO, goodsImagesDTO);

		return new ModelAndView("front", true);
		
	}

	/**
	 * 상품 전체 조회
	 */
	public ModelAndView selectAllGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String brand = request.getParameter("brand");
		String category = request.getParameter("category");
		String arrange = request.getParameter("arrange");

		List<GoodsDTO> list = goodsService.selectAllGoods(brand, category, arrange);
		request.setAttribute("list", list);

		return new ModelAndView("front", true);
	}

	/**
	 * 상품 상세 조회
	 */
	public ModelAndView selectGoodsLine(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String goodsNoStr = request.getParameter("goodsReadNo");
		boolean state = request.getParameter("flag") == null ? true : false;

		int goodsNo = 0;
		if (goodsNoStr != null) {
			goodsNo = Integer.parseInt(goodsNoStr);

			List<GoodsDTO> goodsDTO = goodsService.selectGoodsLine(goodsNo, state);

			request.setAttribute("goodsDTO", goodsDTO);

		}

		return new ModelAndView("front", true);
	}

	/**
	 * 상품 수정
	 */
	public ModelAndView updateGoodsDTO(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String saveDir = request.getRealPath("/save");
		int maxSize = 1024 * 1024 * 100; // 100M
		String encoding = "UTF-8";

		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());


		String brand = m.getParameter("brand");
		String category = m.getParameter("category");
		String goodsName = m.getParameter("goodsName");
		String goodsNameKor = m.getParameter("goodsNameKor");
		String goodsModelNo = m.getParameter("goodsModelNo");
		String goodReleaseDate = m.getParameter("goodReleaseDate");
		int goodsReleasePrice = Integer.parseInt(m.getParameter("goodsReleasePrice"));

		String goodsMainImg = m.getParameter("goodsMainImg");
		String goodsImg1 = m.getParameter("goodsImg1");
		String goodsImg2 = m.getParameter("goodsImg2");
		String goodsImg3 = m.getParameter("goodsImg3");
		String goodsImg4 = m.getParameter("goodsImg4");

		GoodsDTO goodsDTO = new GoodsDTO(brand, category, goodsName, goodsNameKor, goodsModelNo, goodReleaseDate,
				goodsReleasePrice);

		GoodsImagesDTO goodsImagesDTO = new GoodsImagesDTO(goodsMainImg, goodsImg1, goodsImg2, goodsImg3, goodsImg4);

		goodsService.updateGoodsDTO(goodsDTO, goodsImagesDTO);

		return new ModelAndView("front", true);
	}

	/**
	 * 상품 삭제
	 */
	public ModelAndView deleteGoodsDTO(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String goodsNoStr = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNoStr);

		goodsService.deleteGoodsDTO(goodsNo);

		return new ModelAndView("front", true);
	}

}
