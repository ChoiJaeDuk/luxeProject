package luxe.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
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

		return new ModelAndView("/front", true);

	}

	/**
	 * 회원가입
	 */
	public ModelAndView insertUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userAddr = request.getParameter("userAddr")+request.getParameter("useroaddress")+request.getParameter("userDeAddress");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");

		userService.insertUser(new UserDTO(userId, userPwd, userName, userAddr, userPhone,userEmail));

		return new ModelAndView("login.jsp", true);
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
		session.setAttribute("userId", dbDTO);
		session.setAttribute("userId", dbDTO.getUserName());

		return new ModelAndView("index.jsp",true);

	}

	/**
	 * 마이페이지
	 */
	public ModelAndView selectUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");

		UserDTO userDto = userService.selectUser(userId);

		request.setAttribute("userDto", userDto);

		return new ModelAndView("mypage.jsp", true);
	}

	
	
	
	
	/**
	 * 회원정보 수정 
	 */
	public ModelAndView updateUserInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userAddr = request.getParameter("userAddr");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");

		userService.updateUserInfo(userId, userPwd, userAddr, userPhone, userEmail);

		return new ModelAndView("mypage.jsp", true);
	}

	/**
	 * 아이디 찾기
	 */
	public ModelAndView selectUserId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userName = request.getParameter("userName");
		
		String userId = userService.selectUserId(userName);
		
		request.setAttribute("userId", userId);

		return new ModelAndView("/findid.jsp");
	}

	/**
	 * 비밀번호 찾기
	 */
	public ModelAndView selectUserPwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String userId = request.getParameter("userId");

		String userPwd = userService.selectUserPwd(userId);

		request.setAttribute("userPwd", userPwd);

		return new ModelAndView("/findpwd.jsp");
	}

	/**
	 * 로그아웃
	 */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getSession().invalidate();

		return new ModelAndView("index.jsp", true);

	}

	/**
	 * 회원 탈퇴
	 */
	public ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId"); 
		String userPwd = request.getParameter("userPwd");

		userService.deleteUser(userId, userPwd);

		return new ModelAndView("index.jsp", true);
	}

	/**
	 * 회원 전체검색
	 * 
	 * @throws Exception
	 */

	public ModelAndView selectAllUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {

		userService.selectAllUsers();

		return new ModelAndView("/front", true);
	}

	/**
	 * 비밀번호 체크
	 */
	public ModelAndView userPwdCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userPwd = request.getParameter("userPwd");

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		userService.userPwdCheck(new UserDTO(userId, userPwd));

		return new ModelAndView("/front", true);
	}

}
