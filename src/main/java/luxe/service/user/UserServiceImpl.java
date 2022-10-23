package luxe.service.user;

import java.sql.SQLException;

import luxe.dao.user.UserDAO;
import luxe.dao.user.UserDAOImpl;
import luxe.dto.UserDTO;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = new UserDAOImpl();

	/**
	 * 아이디 중복체크
	 */
	@Override
	public void userIdCheck(String userId) throws SQLException {
		boolean result = userDAO.userIdCheck(userId);
		if (result == true) {
			throw new SQLException("이미 존재하는 ID 입니다.");
		}
	}

	/**
	 * 회원가입
	 */
	@Override
	public void insertUser(UserDTO userDto) throws SQLException {
		int result = userDAO.insertUser(userDto);
		if (result == 0) {
			throw new SQLException("회원가입 실패!");
		}
	}

	/**
	 * 로그인
	 */
	@Override
	public UserDTO login(UserDTO userDto) throws SQLException {
		UserDTO dbDTO = userDAO.login(userDto);
		if (dbDTO == null) {
			throw new SQLException("입력정보를 다시 확인해보심이 어떤지");
		}
		return dbDTO;
	}

	/**
	 * 회원정보 조회
	 */
	@Override
	public UserDTO selectUser(String userId) throws SQLException {
		UserDTO userDto = userDAO.selectUser(userId);

		return userDto;
	}

	/**
	 * 회원정보 수정 비밀번호
	 */
	@Override
	public void updateUserPwd(String userId, String userOldPwd, String userNewPwd) throws SQLException {
		int result = userDAO.updateUserPwd(userId, userOldPwd, userNewPwd);
		if (result == 0) {
			throw new SQLException("");
		}
	}

	/**
	 * 회원정보 수정 주소
	 */
	@Override
	public void updateUserAddr(String userId, String userNewAddr, String userNewDetailAddr) throws SQLException {
		int result = userDAO.updateUserAddr(userId, userNewAddr, userNewDetailAddr);
		if (result == 0) {
			throw new SQLException("");
		}
	}

	/**
	 * 회원정보 수정 전화번호
	 */
	@Override
	public void updateUserPhone(String userId, String userNewPhone) throws SQLException {
		int result = userDAO.updateUserPhone(userId, userNewPhone);
		if (result == 0) {
			throw new SQLException("");
		}
	}

	/**
	 * 아이디 찾기
	 */
	@Override
	public String selectUserId(String userName, String userPhone) throws SQLException {
		String userId = userDAO.selectUserId(userName, userPhone);
		if (userId == null) {
			throw new SQLException("ID 찾기 오류");
		}
		return userId;
	}

	/**
	 * 비밀번호 찾기
	 */
	@Override
	public String selectUserPwd(String userId, String userPhone) throws SQLException {
		String userPwd = userDAO.selectUserId(userId, userPhone);
		if (userPwd == null) {
			throw new SQLException("PWD 찾기 오류");
		}
		return userPwd;
	}

	/**
	 * 회원 탈퇴
	 */
	@Override
	public void deleteUser(String userId, String userPwd) throws Exception {
		int result = userDAO.deleteUser(userId, userPwd);
		if (result == 0)
			throw new Exception("회원탈퇴 실패");
	}

}
