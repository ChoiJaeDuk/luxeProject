package luxe.controller.alarm;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.dto.AlarmDTO;
import luxe.service.alarm.AlarmService;
import luxe.service.alarm.AlarmServiceImpl;
import net.sf.json.JSONArray;

public class AlarmAjaxController implements AjaxController {
	AlarmService service = new AlarmServiceImpl();

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void selectAlarm(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session =  request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		//String userId = request.getParameter("userId");
		
		List<AlarmDTO> list = service.selectAlarm(userId);
		
		JSONArray arr = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}
	
	public void countNewAlarm(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session =  request.getSession();
		String userId = (String)session.getAttribute("userId");
		
		//String userId = request.getParameter("userId");
		
		int result = service.countNewAlarm(userId);
	
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	public void deleteAlarm(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		System.out.println("왔니 ?");
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		String alarmNo = request.getParameter("alarmNo");
		System.out.println(alarmNo);

	
		int result = service.deleteAlarm(userId, Integer.parseInt(alarmNo));
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

}
