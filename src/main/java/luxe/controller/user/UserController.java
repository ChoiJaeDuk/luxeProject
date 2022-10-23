package luxe.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import luxe.controller.Controller;
import luxe.controller.ModelAndView;
import luxe.dto.UserDTO;
import luxe.service.user.UserService;
import luxe.service.user.UserServiceImpl;

public class UserController implements Controller {

	private UserService userService = new UserServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 중복체크
	 */

	public ModelAndView userIdCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");

		userService.userIdCheck(userId);

		return new ModelAndView("front", true);

	}

	/**
	 * 회원가입
	 */
	public ModelAndView insertUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userAddr = request.getParameter("userAddr");
		String userDetailAddr = request.getParameter("userDetailAddr");
		String userPhone = request.getParameter("userPhone");
		String userJob = request.getParameter("userJob");

		userService.insertUser(new UserDTO(userId, userPwd, userName, userAddr, userDetailAddr, userPhone, userJob));

		return new ModelAndView("front", true);
	}

	/**
	 * 로그인
	 */
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		UserDTO dbDTO = userService.login(new UserDTO(userId, userPwd));

		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dbDTO);
		session.setAttribute("loginUser", dbDTO.getUserName());

		return new ModelAndView("/front", true);

	}

	/**
	 * 마이페이지
	 */
	public ModelAndView selectUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");

		UserDTO userDto = userService.selectUser(userId);

		request.setAttribute("userDto", userDto);

		return new ModelAndView("/front", true);
	}

	public ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userAddr = request.getParameter("userAddr");
		String userDetailAddr = request.getParameter("userDetailAddr");
		String userPhone = request.getParameter("userPhone");
		
		userService.updateUser(new UserDTO(userId, userPwd, userName, userAddr, userDetailAddr, userPhone, userPhone));
		
		return new ModelAndView("/front", true);

	}

	/**
	 * 아이디 찾기
	 */
	public ModelAndView selectUserId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");

		String userId = userService.selectUserId(userName, userPhone);

		request.setAttribute("userId", userId);

		return new ModelAndView("/front", true);
	}

	/**
	 * 비밀번호 찾기
	 */
	public ModelAndView selectUserPwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");
		String userPhone = request.getParameter("userPhone");

		String userPwd = userService.selectUserPwd(userId, userPhone);

		request.setAttribute("userPwd", userPwd);

		return new ModelAndView("/front", true);
	}

	/**
	 * 로그아웃
	 */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getSession().invalidate();

		return new ModelAndView("/front", true);

	}

	/**
	 * 회원 탈퇴
	 */
	public ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		userService.deleteUser(userId, userPwd);

		return new ModelAndView("/front", true);
	}
}
