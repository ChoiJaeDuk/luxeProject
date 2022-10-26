package luxe.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.AjaxController;
import luxe.dto.UserDTO;
import luxe.service.user.UserService;
import luxe.service.user.UserServiceImpl;

public class UserAjaxController implements AjaxController {

	UserService userService = new UserServiceImpl();

	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	public void selectUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		UserDTO userDto = userService.selectUser(userId);
		PrintWriter out = response.getWriter();
		out.print(userId);

	}

	public void updateUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		String userAddr = request.getParameter("userAddr");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");

		UserDTO userDto = new UserDTO(userId, userAddr, userPhone, userEmail);
		userService.updateUserInfo(userId, userAddr, userPhone, userEmail);
		
		PrintWriter out = response.getWriter();
		out.print(userDto);

	}

}
