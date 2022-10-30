package luxe.controller.goods;

import java.io.IOException;
import java.io.PrintWriter;
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
import net.sf.json.JSONArray;

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

	
		String goodsMainImg = m.getFilesystemName("goodsMainImg");

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
		String sort = request.getParameter("sort");
		String userId =request.getParameter("userId");
		String search = request.getParameter("search");

		//List<GoodsDTO> list = goodsService.selectAllGoods(brand, category, sort,userId,search);
		//request.setAttribute("list", list);
		request.setAttribute("state", "1");
		request.setAttribute("search", search);
		return new ModelAndView("shop/shop.jsp");
	}

	/**
	 * 상품 상세 조회
	 */
	public ModelAndView selectGoodsLine(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String goodsNoStr = request.getParameter("goodsReadNo");
		String addr = request.getParameter("addr");
		boolean state = true;//request.getParameter("flag") == null ? true : false;
		
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
		
			GoodsDTO goodsDTO = goodsService.selectGoodsLine(goodsNo, state);
		
			request.setAttribute("goodsDTO", goodsDTO);
		
	
		return new ModelAndView(addr);
	}
	
	/*
	public ModelAndView selectOrderPrice(HttpServletRequest request, HttpServletResponse response) throws Exception {//재덕 판매창 넘어갈때 정보 전송용
		//String goodsNoStr = request.getParameter("goodsReadNo");
		
		boolean state = true;//request.getParameter("flag") == null ? true : false;

		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));

			GoodsDTO goodsDTO = goodsService.selectGoodsLine(goodsNo, state);
		
			request.setAttribute("goodsDTO", goodsDTO);

		return new ModelAndView("OrderBysell.jsp");
	}
	*/

	
	public ModelAndView sellApplication(HttpServletRequest request, HttpServletResponse response) throws Exception {//재덕 판매신청 창 넘어갈때 정보 전송용
		//String goodsNoStr = request.getParameter("goodsReadNo");
		String addr = request.getParameter("");
		boolean state = true;//request.getParameter("flag") == null ? true : false;
		int inputPrice = Integer.parseInt(request.getParameter("inputPrice"));
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));

			GoodsDTO goodsDTO = goodsService.selectGoodsLine(goodsNo, state);
		
			request.setAttribute("goodsDTO", goodsDTO);
			request.setAttribute("inputPrice", inputPrice);
		return new ModelAndView("sell.jsp");
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
		String goodsReleaseDate = m.getParameter("goodsReleaseDate");
		int goodsReleasePrice = Integer.parseInt(m.getParameter("goodsReleasePrice"));

		String goodsMainImg = m.getFilesystemName("goodsMainImg");

		String goodsImg1 = m.getFilesystemName("goodsImg1");
		String goodsImg2 = m.getFilesystemName("goodsImg2");
		String goodsImg3 = m.getFilesystemName("goodsImg3");
		String goodsImg4 = m.getFilesystemName("goodsImg4");

		GoodsDTO goodsDTO = new GoodsDTO(brand, category, goodsName, goodsNameKor, goodsModelNo, goodsReleaseDate,
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
	
	public ModelAndView selectGoodsByGoodsName(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String goodName = request.getParameter("goodsName");

		List<GoodsDTO> list = goodsService.selectGoodsByGoodsName(goodName);
		request.setAttribute("goodList", list);
		request.setAttribute("state", "1");

		return new ModelAndView("shop/shop.jsp");
	}

	
	public ModelAndView selectAllGoodsInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		List<GoodsDTO> list = goodsService.selectAllGoodsInfo();
		

		return new ModelAndView("Manager/ManagerProduct.jsp");
	}
}
