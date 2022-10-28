package luxe.service.user;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.user.UserDAO;
import luxe.dao.user.UserDAOImpl;
import luxe.dto.UserDTO;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO = new UserDAOImpl();

	/**
	 * 아이디 중복체크
	 */
	@Override
	public boolean userIdCheck(String userId) throws SQLException {
		boolean result = userDAO.userIdCheck(userId);
		if (result == true) {
			throw new SQLException("이미 존재하는 ID 입니다.");
		}
		return result;
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
			throw new SQLException("입력정보를 다시 확인하세요");
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
	 * 회원정보 수정
	 */
	@Override
	public void updateUserInfo(String userId, String userAddr, String userPhone, String userEmail) throws SQLException {
		int result = userDAO.updateUserInfo(userId, userAddr, userPhone, userEmail);
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

	/**
	 * 회원 전체검색
	 */
	@Override
	public List<UserDTO> selectAllUsers() throws Exception {

		List<UserDTO> list = userDAO.selectAllUsers();
		if (list == null) {
			throw new Exception("회원정보 조회 실패");
		}
		return list;
	}

	/**
	 * 비밀번호 체크
	 */
	@Override
	public void userPwdCheck(UserDTO userDto) throws Exception {

		String userPwd = userDAO.userPwdCheck(userDto);
		if (userPwd == null) {
			throw new Exception("비밀번호가 존재하지 않습니다.");
		} else if (!userPwd.equals(userDto.getUserPwd())) {
			throw new Exception("비밀번호 불일치");
		}

	}

}
