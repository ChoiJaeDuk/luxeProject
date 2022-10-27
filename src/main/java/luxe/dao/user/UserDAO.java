package luxe.dao.user;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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
	 * 주소
	 */
	int updateUserInfo(String userId, String userAddr,String userPhone, String userEmail)throws SQLException;
	
	/**
	 * 회원 탈퇴
	 * 
	 * @param userId
	 * @throws Exception
	 */
	int deleteUser(String userId, String userPwd) throws Exception;
	
	/***
	 * 회원아이디에 해당하는 email주소 조회
	 * @param con
	 * @param buyerId
	 * @param sellerId
	 * @return
	 * @throws Exception
	 */
	List<String> selectEmailAddressByUserId(Connection con, String buyerId, String sellerId) throws Exception;
	
	/**
	 * 비밀번호 체크
	 * 
	 * @return
	 */

	String userPwdCheck(UserDTO userDto) throws Exception;

	
	/**
	 * 회원 전체조회
	 */

	List<UserDTO> selectAllUsers() throws Exception;


}