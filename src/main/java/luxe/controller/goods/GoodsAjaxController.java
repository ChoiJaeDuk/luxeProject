package luxe.controller.goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import luxe.controller.AjaxController;
import luxe.controller.ModelAndView;
import luxe.dto.GoodsDTO;
import luxe.dto.GoodsImagesDTO;
import luxe.service.goods.GoodsService;
import luxe.service.goods.GoodsServiceImpl;
import luxe.service.goodsImages.GoodsImagesService;
import luxe.service.goodsImages.GoodsImagesServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GoodsAjaxController implements AjaxController {
	private GoodsService goodsService = new GoodsServiceImpl();
	private GoodsImagesService goodsImgService = new GoodsImagesServiceImpl();

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	public void selectAllGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		String brand = request.getParameter("brand");
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");

		
		String search = request.getParameter("search");
		
		System.out.println("brand = " + brand);
		System.out.println("category = " + category);
		System.out.println("sort = " + sort);

		// 로그인 여부 판단
		/*
		 * HttpSession session=request.getSession();
		 * 
		 * String userId=null; if(session.getAttribute("userId")!=null) { userId =
		 * (String)session.getAttribute("userId"); }
		 */

		List<GoodsDTO> list = goodsService.selectAllGoods(brand, category, sort, userId, search);
		

		System.out.println(list.size());
		JSONArray arr = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.print(arr);

	}

//	public void selectGoodsByGoodsName(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		response.setContentType("text/html;charset=UTF-8");
//		String keyWord = request.getParameter("keyWord");
//		
//		List<GoodsDTO> list = goodsService.selectGoodsByGoodsName(keyWord);
//		
//		JSONArray arr = JSONArray.fromObject(list);
//		
//		PrintWriter out = response.getWriter();
//		out.print(arr);
//		
//	}

	public void selectGoodsByGoodsName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String keyWord = request.getParameter("keyWord");
		List<String> list = this.search(keyWord);

		JSONArray arr = JSONArray.fromObject(list);

		// front단으로 응답(데이터전송))
		PrintWriter out = response.getWriter();
		out.println(arr);
	}

	private List<String> search(String keyWord) {
		List<String> list = new ArrayList<String>();
		List<GoodsDTO> goodsDTO = new ArrayList<GoodsDTO>();
		try {
			goodsDTO = goodsService.selectGoodsByGoodsName(keyWord);

			for (GoodsDTO goods : goodsDTO) {
				System.out.println(goods);

				if (goods.getGoodsNameKor().startsWith(keyWord)) {
					list.add(goods.getGoodsNameKor());

				} else if (goods.getGoodsName().toUpperCase().startsWith(keyWord.toUpperCase())) {
					list.add(goods.getGoodsName());

				} else if (goods.getCategory().startsWith(keyWord)) {
					list.add(goods.getGoodsNameKor());
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public void searchGoodsName(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");

		String goodsName = request.getParameter("goodsName");
		List<GoodsDTO> goodsDTO = goodsService.selectGoodsByGoodsName(goodsName);
	
		JSONArray arr = JSONArray.fromObject(goodsDTO);

		PrintWriter out = response.getWriter();
		out.println(arr);

	}
	
	public void selectAllGoodsInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		List<GoodsDTO> list = goodsService.selectAllGoodsInfo();
		

		JSONArray arr = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.print(arr);
	}
	
	public void deleteGoodsDTO(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		String goodsNo = request.getParameter("goodsNo");
		
		int result = goodsService.deleteGoodsDTO(Integer.parseInt(goodsNo));
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	
	
	/**
	 * 상품 상세 조회
	 */
	public void selectGoodsLine(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		//String goodsNoStr = request.getParameter("goodsReadNo");
		String addr = request.getParameter("addr");
		boolean state = true;//request.getParameter("flag") == null ? true : false;
		
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
		
		GoodsDTO goodsDTO = goodsService.selectGoodsLine(goodsNo, state);
		System.out.println(goodsDTO.getGoodsName());
		JSONObject goods = JSONObject.fromObject(goodsDTO);
		PrintWriter out = response.getWriter();
		
		out.print(goods);
		
	}
	
	
	
	/**
	 * 관리자 상품 업데이트
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public void updateGoodsDTO(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String saveDir = request.getRealPath("/img");
		int maxSize = 1024 * 1024 * 100; // 100M
		String encoding = "UTF-8";

		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		int goodsNo = Integer.parseInt(m.getParameter("goodsNo"));
		
		String brand = m.getParameter("brand");
		String category = m.getParameter("category");
		String goodsName = m.getParameter("goodsName");
		String goodsNameKor = m.getParameter("goodsNameKor");
		String goodsModelNo = m.getParameter("goodsModelNo");
		String goodsReleaseDate = m.getParameter("goodsReleaseDate");
		int goodsReleasePrice = Integer.parseInt(m.getParameter("goodsReleasePrice"));
		System.out.println( brand + category + goodsName + goodsNameKor + goodsModelNo + goodsReleaseDate + goodsReleasePrice);
		String goodsMainImg = m.getFilesystemName("img1");
		String goodsImg1 = m.getFilesystemName("img2");
		String goodsImg2 = m.getFilesystemName("img3");

		String updateImg = "";
		GoodsDTO goodsDTO = new GoodsDTO(brand, category, goodsName, goodsNameKor, goodsModelNo, goodsReleaseDate, goodsReleasePrice, goodsNo);
		GoodsImagesDTO goodsImagesDTO = new GoodsImagesDTO();
		if(m.getFilesystemName("img1")!=null) {
			
			goodsImagesDTO.setGoodsMainImg(goodsMainImg);
			updateImg = "GOODS_MAIN_IMG = '"+goodsMainImg+"'";
			System.out.println(updateImg);
			goodsImgService.updateImages(updateImg, goodsNo);
		}
		if(m.getFilesystemName("img2")!=null) {
			
			goodsImagesDTO.setGoodsImg1(goodsImg1);
			updateImg = "GOODS_IMG1 = '"+goodsImg1+"'";
			goodsImgService.updateImages(updateImg, goodsNo);
		}
		if(m.getFilesystemName("img3")!=null) {
			
			goodsImagesDTO.setGoodsImg2(goodsImg2);
			updateImg = "GOODS_IMG2 = '" + goodsImg2 + "'";
			goodsImgService.updateImages(updateImg, goodsNo);
		}

		goodsService.updateGoodsDTO(goodsDTO);

	}
}
