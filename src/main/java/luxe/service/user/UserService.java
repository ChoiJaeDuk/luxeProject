package luxe.service.user;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.UserDTO;

public interface UserService {

	/**
	 * 아이디 중복체크
	 * 
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	boolean userIdCheck(String userId) throws SQLException;

	/**
	 * 회원가입
	 * 
	 * @param userDto
	 * @throws SQLException
	 */
	void insertUser(UserDTO userDto) throws SQLException;

	/**
	 * 로그인
	 * 
	 * @param userDto
	 * @return
	 * @throws SQLException
	 */
	UserDTO login(UserDTO userDto) throws SQLException;

	/**
	 * 회원정보 조회
	 * 
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	UserDTO selectUser(String userId) throws SQLException;

	/**
	 * 아이디 찾기
	 * 
	 * @param userName
	 * @param userPhone
	 * @return
	 * @throws SQLException
	 */
	String selectUserId(String userName) throws SQLException;

	/**
	 * 비밀번호 찾기
	 * 
	 * @param userId
	 * @param userPhone
	 * @return
	 * @throws SQLException
	 */
	String selectUserPwd(String userId) throws SQLException;

	/**
	 * 회원정보 수정
	 * @return 
	 * 
	 * @throws SQLException
	 */
	int updateUserInfo(String userId, String userPwd, String userAddr, String userPhone, String userEmail)
			throws SQLException;

	/**
	 * 회원 탈퇴
	 * 
	 * @param userId
	 * @param userPwd
	 * @throws Exception
	 */
	void deleteUser(String userId, String userPwd) throws Exception;

	/**
	 * 회원 전체 검색
	 * 
	 * @return
	 * @throws Exception
	 */
	List<UserDTO> selectAllUsers() throws Exception;

	void userPwdCheck(UserDTO userDto) throws Exception;

}
