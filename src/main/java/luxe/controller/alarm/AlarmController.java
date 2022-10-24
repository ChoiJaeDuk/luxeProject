package luxe.controller.alarm;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.AlarmDTO;
import luxe.dto.AlarmReceiveUserDTO;
import luxe.service.alarm.AlarmService;
import luxe.service.alarm.AlarmServiceImpl;

public class AlarmController implements Controller {
	AlarmService service = new AlarmServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView insertAlarm(HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		String alarmNo = request.getParameter("alarmNo");
		String goodsNo = request.getParameter("goodsNo");
		String alarmContent = request.getParameter("alarmContent");
		String issueDate = request.getParameter("issueDate");
		String alarmSubject = request.getParameter("alarmSubject");
		
		AlarmDTO alarm = new AlarmDTO(Integer.parseInt(alarmNo), Integer.parseInt(goodsNo), alarmContent, issueDate, alarmSubject);
		
		service.insertAlarm(alarm);
		
		return new ModelAndView("front", true);
	}
	
	public ModelAndView selectAlarm(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		String userId = request.getParameter("userId");
		List<AlarmDTO> list = service.selectAlarm(userId);
		request.setAttribute("list", list);
		
		return new ModelAndView("jieunTest.jsp");
	}
	
	public ModelAndView checkNewAlarm(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		String userId = request.getParameter("userId");
		boolean result = service.checkNewAlarm(userId);
		request.setAttribute("result", result);
		
		return new ModelAndView("jieunTest.jsp");
	}
	
	public ModelAndView deleteAlarm(HttpServletRequest request, HttpServletResponse response)
			throws Exception{

		String userId = request.getParameter("userId");
		String alarmNo = request.getParameter("alarmNo");
		
		service.deleteAlarm(userId, Integer.parseInt(alarmNo));
		
		return new ModelAndView("front", true);
	}

}
