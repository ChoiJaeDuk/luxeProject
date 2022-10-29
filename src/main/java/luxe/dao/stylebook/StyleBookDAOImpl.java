package luxe.dao.stylebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.StyleBookDTO;
import luxe.util.DbUtil;

public class StyleBookDAOImpl implements StyleBookDAO {

	@Override
	public List<StyleBookDTO> selectAllStyleBook(String filter, String sortCondition) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select board_reg_no, user_id, s.goods_no, board_content, fname, board_reg_date, read_no, like_no, g.brand from stylebook s join goods g \r\n"
				+ "on s.goods_no=g.goods_no group by board_reg_no, user_id, s.goods_no, board_content, fname, board_reg_date, read_no, like_no, g.brand "
				+ filter + sortCondition;
		List<StyleBookDTO> list = new ArrayList<StyleBookDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			System.out.println(sql);
			while (rs.next()) {
				list.add(new StyleBookDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getInt(8)));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public List<StyleBookDTO> selectStyleBookByGoodsNo(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select rownum, s.* from (select * from stylebook where goods_no=? order by like_no desc) s where rownum<=3";
		List<StyleBookDTO> list = new ArrayList<StyleBookDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			rs = ps.executeQuery();

			System.out.println(sql);
			while (rs.next()) {
				list.add(new StyleBookDTO(rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
						rs.getString(7), rs.getInt(8), rs.getInt(9)));

			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public StyleBookDTO selectStyleBookByBoardRegNo(int boardRegNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select board_reg_no, user_id, s.goods_no, board_content, fname, \r\n"
				+ "board_reg_date, read_no, like_no, goods_model_no, g.brand, goods_name, goods_name_kor \r\n"
				+ "from stylebook s join goods g on s.goods_no=g.goods_no and  board_reg_no=?\r\n"
				+ "group by board_reg_no, user_id, s.goods_no, board_content, fname, board_reg_date, \r\n"
				+ "read_no, like_no, goods_model_no, g.brand, goods_name, goods_name_kor";
		StyleBookDTO stylebook = null;

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardRegNo);
			rs = ps.executeQuery();

			if (rs.next()) {
				stylebook = new StyleBookDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return stylebook;
	}

	@Override
	public int increaseStyleBookReadNo(int boardRegNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update STYLEBOOK set READ_NO=READ_NO+1 where BOARD_REG_NO=?";
		int result = 0;

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardRegNo);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int increaseStyleBookLikeNo(int boardRegNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update STYLEBOOK set LIKE_NO=LIKE_NO+1 where BOARD_REG_NO=?";
		int result = 0;

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardRegNo);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int insertStyleBook(StyleBookDTO styleBook) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into STYLEBOOK values(BOARD_REG_NO_SEQ.NEXTVAL, ?, ?, ?, ?, CURRENT_DATE, 0, 0)";
		int result = 0;

		/*
		 * 삭제 예정 BOARD_REG_NO NUMBER CONSTRAINT BOARD_REG_NO_PK PRIMARY KEY, USER_ID
		 * VARCHAR(30) NOT NULL REFERENCES USERS(USER_ID)ON DELETE CASCADE, GOODS_NO
		 * NUMBER NOT NULL REFERENCES GOODS(GOODS_NO)ON DELETE CASCADE, BOARD_CONTENT
		 * VARCHAR2(500), FNAME VARCHAR2(50) NOT NULL, BOARD_REG_DATE DATE NOT NULL,
		 * READ_NO NUMBER NOT NULL, LIKE_NO NUMBER NOT NULL
		 */
		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, styleBook.getUserId());
			ps.setInt(2, styleBook.getGoodsNo());
			ps.setString(3, styleBook.getBoardContent());
			ps.setString(4, styleBook.getfName());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int deleteStyleBook(int boardRegNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "delete from STYLEBOOK where BOARD_REG_NO=?";
		int result = 0;

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardRegNo);

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int updateStyleBook(StyleBookDTO styleBook) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update STYLEBOOK set BOARD_CONTENT=? where BOARD_REG_NO=?";
		int result = 0;

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, styleBook.getBoardContent());
			ps.setInt(3, styleBook.getBoardRegNo());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

}
