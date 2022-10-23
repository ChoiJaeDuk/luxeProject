package luxe.service.user;

import java.sql.SQLException;

import luxe.dto.UserDTO;

public interface UserService {

	/**
	 * 아이디 중복체크
	 * @param userId
	 * @throws SQLException
	 */
	void userIdCheck(String userId) throws SQLException;
	
	/**
	 * 회원가입
	 * @param userDto
	 * @throws SQLException
	 */
	void insertUser(UserDTO userDto)throws SQLException;
	
	/**
	 * 로그인
	 * @param userDto
	 * @return
	 * @throws SQLException
	 */
	UserDTO login(UserDTO userDto) throws SQLException;
	
	/**
	 * 회원정보 조회
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	UserDTO selectUser(String userId)throws SQLException;
	
	/**
	 * 아이디 찾기
	 * @param userName
	 * @param userPhone
	 * @return
	 * @throws SQLException
	 */
	String selectUserId(String userName, String userPhone) throws SQLException;
	
	/**
	 * 비밀번호 찾기
	 * @param userId
	 * @param userPhone
	 * @return
	 * @throws SQLException
	 */
	String selectUserPwd(String userId, String userPhone) throws SQLException;

	/**
	 * 회원정보 수정
	 * 비밀번호
	 */
	void updateUserPwd(String userId, String userOldPwd, String userNewPwd) throws SQLException;

	/**
	 * 회원정보 수정
	 * 주소
	 * @throws SQLException 
	 */
	void updateUserAddr(String userId, String userNewAddr,String userNewDetailAddr) throws SQLException;
	
	/**
	 * 회원정보 수정
	 * 전화번호
	 */
	
	void updateUserPhone(String userId, String userNewPhone) throws SQLException;

	/**
	 * 회원 탈퇴 
	 * @param userId
	 * @param userPwd
	 * @throws Exception
	 */
	void deleteUser(String userId, String userPwd) throws Exception;

	
}
