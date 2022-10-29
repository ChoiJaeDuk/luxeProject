package luxe.controller.regisGoods;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Provider.Service;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.dao.regisGoods.RegisGoodsDAO;
import luxe.dao.regisGoods.RegisGoodsDAOImpl;
import luxe.dto.AlarmDTO;
import luxe.dto.RegisGoodsDTO;
import luxe.service.alarm.AlarmService;
import luxe.service.alarm.AlarmServiceImpl;
import luxe.service.regisGoods.RegisGoodsService;
import luxe.service.regisGoods.RegisGoodsServiceImpl;
import net.sf.json.JSONArray;

public class RegisGoodsAjaxController implements AjaxController {
	RegisGoodsService serivce = new RegisGoodsServiceImpl();

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void selectAllRegisGoods(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session =  request.getSession();
	
		List<RegisGoodsDTO> list = serivce.selectAllRegisGoods();
		
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}
	
	

}
