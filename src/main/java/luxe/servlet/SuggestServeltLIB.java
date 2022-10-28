package luxe.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.dto.GoodsDTO;
import luxe.service.goods.GoodsService;
import luxe.service.goods.GoodsServiceImpl;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class SuggestServeltLIB
 */
@WebServlet("/suggestServeltLIB")
public class SuggestServeltLIB extends HttpServlet {
	GoodsService service = new GoodsServiceImpl();
	
	private static final long serialVersionUID = 1L;
       
	public List<String> search(String keyWord){
		List<String> list = new ArrayList<String>();
		List<GoodsDTO> goodsDTO = new ArrayList<GoodsDTO>();
		try {
			goodsDTO = service.selectGoodsByGoodsName(keyWord);
			
			for(GoodsDTO goods :goodsDTO) {
				
				if(goods.getGoodsName().toUpperCase().startsWith(keyWord.toUpperCase())) {
					list.add(goods.getGoodsName());
					
				}else if(goods.getGoodsNameKor().startsWith(keyWord)){
					list.add(goods.getGoodsNameKor());
				}
			}
		
					
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return list;
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String keyWord = request.getParameter("keyWord");
		List<String> list = this.search(keyWord);
		
		JSONArray arr = JSONArray.fromObject(list);
		
		
		//front단으로 응답(데이터전송))
		PrintWriter out = response.getWriter();
		out.println(arr);
	}

}
