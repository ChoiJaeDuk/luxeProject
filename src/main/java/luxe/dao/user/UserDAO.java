package luxe.dao.user;

import java.sql.SQLException;

import luxe.dto.UserDTO;

public interface UserDAO {

	/**
	 * 아이디 중복체크
	 * 
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	boolean userIdCheck(String userId) throws SQLException;

	/**
	 * 회원 가입
	 * 
	 * @param userDto
	 * @return
	 * @throws SQLException
	 */
	int insertUser(UserDTO userDto) throws SQLException;

	/**
	 * 로그인
	 * 
	 * @param userDto
	 * @return
	 * @throws SQLException
	 */
	UserDTO login(UserDTO userDto) throws SQLException;

	/**
	 * 회원 정보 조회 - 마이페이지
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
	String selectUserId(String userName, String userPhone) throws SQLException;

	/**
	 * 비밀번호 찾기
	 * 
	 * @param userId
	 * @param userPhone
	 * @return
	 * @throws SQLException
	 */
	String selectUserPwd(String userId, String userPhone) throws SQLException;

	/**
	 * 회원정보 수정
	 * 
	 * @param userDto
	 * @return
	 * @throws SQLException
	 */
	int updateUser(UserDTO userDto) throws SQLException;

	/**
	 * 회원 탈퇴
	 * 
	 * @param userId
	 * @throws Exception
	 */
	int deleteUser(String userId, String userPwd) throws Exception;

}
