package luxe.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Provider.Service;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.controller.ModelAndView;
import luxe.dto.UserDTO;
import luxe.service.user.UserService;
import luxe.service.user.UserServiceImpl;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class UserAjaxController implements AjaxController {

	UserService userService = new UserServiceImpl();

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	public void userIdCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		response.setContentType("text/html;charset=UTF-8");

		String userId = request.getParameter("userId");
	
		boolean result = userService.userIdCheck(userId);
		System.out.println(result);
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	public void selectUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		UserDTO userDto = userService.selectUser(userId);
		System.out.println(userDto);

		JSONObject user = JSONObject.fromObject(userDto);

		PrintWriter out = response.getWriter();
		out.print(user);

	}

	public void updateUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String userPwd = request.getParameter("userPwd");
		String userAddr = request.getParameter("userAddr");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");

		int result = userService.updateUserInfo(userId, userPwd, userAddr, userPhone, userEmail);

		PrintWriter out = response.getWriter();
		out.print(result);

	}

	public void selectAllUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		// String userId = (String) session.getAttribute("userId");

		List<UserDTO> list = userService.selectAllUsers();
		JSONArray arr = JSONArray.fromObject(list);

		PrintWriter out = response.getWriter();
		out.print(arr);

	}

	public void sellUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		response.setContentType("text/html;charset=UTF-8");
		String userId = request.getParameter("userId");

		UserDTO userDto = userService.selectUser(userId);

		request.setAttribute("userDto", userDto);

		JSONObject user = JSONObject.fromObject(userDto);

		PrintWriter out = response.getWriter();
		out.print(user);
	}

}
