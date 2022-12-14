package luxe.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.UserDTO;
import luxe.util.DbUtil;

public class UserDAOImpl implements UserDAO {

	/**
	 * 아이디 중복 체크
	 */

	@Override
	public boolean userIdCheck(String userId) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select user_id from users where user_id=?");
			ps.setString(1, userId);
			rs = ps.executeQuery();
			System.out.println(userId);
			if (rs.next()) {
				result = true;
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}

	/**
	 * 회원가입
	 */
	@Override
	public int insertUser(UserDTO userDto) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into users values(?,?,?,?,?,'회원',?)";
		int result = 0;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userDto.getUserId());
			ps.setString(2, userDto.getUserPwd());
			ps.setString(3, userDto.getUserName());
			ps.setString(4, userDto.getUserAddr());
			ps.setString(5, userDto.getUserPhone());
			ps.setString(6, userDto.getUserEmail());
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;

	}

	/**
	 * 로그인
	 */
	@Override
	public UserDTO login(UserDTO userDto) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO dbDTO = null;

		String sql = "select * from users where user_id=? and user_pwd=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userDto.getUserId());
			ps.setString(2, userDto.getUserPwd());

			rs = ps.executeQuery();
			if (rs.next()) {
				dbDTO = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return dbDTO;
	}

	/**
	 * 회원 정보 조회 - 마이 페이지
	 */
	@Override
	public UserDTO selectUser(String userId) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserDTO userDto = null;
		String sql = "select * from users where user_id =?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);

			rs = ps.executeQuery();
			if (rs.next()) {
				userDto = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return userDto;

	}

	/**
	 * 회원정보 수정
	 * 
	 */
	@Override
	public int updateUserInfo(String userId, String userPwd, String userAddr, String userPhone, String userEmail)
			throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update users set user_pwd=?, user_addr =?, user_phone=?, user_e_mail =? where user_id=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userPwd);
			ps.setString(2, userAddr);
			ps.setString(3, userPhone);
			ps.setString(4, userEmail);
			ps.setString(5, userId);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;
	}

	/**
	 * 아이디 찾기
	 */
	@Override
	public String selectUserId(String userName) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String userId = null;

		String sql = "select user_id from users where user_name = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userName);
			rs = ps.executeQuery();
			if (rs.next())
				userId = rs.getString(1);
		} finally {
			DbUtil.dbClose(con, ps, rs);

		}
		return userId;
	}

	/**
	 * 비밀번호 찾기
	 */
	@Override
	public String selectUserPwd(String userId) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String userPwd = null;

		String sql = "select user_pwd from users where user_id = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);

			rs = ps.executeQuery();
			if (rs.next())
				userPwd = rs.getString(1);
		} finally {
			DbUtil.dbClose(con, ps, rs);

		}
		return userPwd;

	}

	/**
	 * 회원 탈퇴
	 */
	@Override
	public int deleteUser(String userId, String userPwd) throws Exception {

		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "delete users where user_id = ? and user_pwd = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userPwd);

			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public List<String> selectEmailAddressByUserId(Connection con, String buyerId, String sellerId) throws Exception { // 지은
		PreparedStatement ps = null;
		ResultSet rs = null;

		// List<UserDTO> list = new ArrayList<UserDTO>();
		List<String> address = new ArrayList<String>();

		String sql = "select user_e_mail from users where user_id in (?,?)";

		try {

			ps = con.prepareStatement(sql);

			ps.setString(1, buyerId);
			ps.setString(2, sellerId);

			rs = ps.executeQuery();
			while (rs.next()) {
				address.add(rs.getString(1));
			}

		} finally {
			DbUtil.dbClose(null, ps, rs);
		}

		return address;
	}

	@Override
	public List<UserDTO> selectAllUsers() throws Exception {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from users where not user_job = '관리자'";
		List<UserDTO> selectAllUsers = new ArrayList<UserDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				UserDTO userDTO = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
				selectAllUsers.add(userDTO);
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return selectAllUsers;
	}

	/**
	 * 비밀번호 체크
	 */
	@Override
	public String userPwdCheck(UserDTO userDto) throws Exception {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select user_pwd from users where user_id=?";
		String userPwd = null;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				userPwd = rs.getString(1);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}

		return userPwd;
	}

}
