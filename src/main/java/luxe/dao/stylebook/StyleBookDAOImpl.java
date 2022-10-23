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
	public List<StyleBookDTO> selectAllStyleBook() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from stylebook";
		List<StyleBookDTO> list = new ArrayList<StyleBookDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

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
	public List<StyleBookDTO> selectSortedStyleBook(String sortCondition) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from stylebook order by ";
		List<StyleBookDTO> list = new ArrayList<StyleBookDTO>();

		try {
			sql = this.addSortCondition(sql, sortCondition);

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new StyleBookDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getInt(8)));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	private String addSortCondition(String sql, String sortCondition) {
		switch (sortCondition) {
		case "readNo":
			sql += "read_no desc";
			break;
		case "likeNo":
			sql += "LIKE_NO desc";
			break;
		case "boardRegDate":
			sql += "BOARD_REG_DATE desc";
			break;
		}
		return sql;
	}

	@Override
	public List<StyleBookDTO> selectStyleBookByBrand(String brand, String sortCondition) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from stylebook where brand=? order by ";
		List<StyleBookDTO> list = new ArrayList<StyleBookDTO>();

		try {

			if (sortCondition != null) {
				sql = this.addSortCondition(sql, sortCondition);
			}

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, brand);
			rs = ps.executeQuery();

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
	public List<StyleBookDTO> selectStyleBookByGoodsNo(int goodsNo, String sortCondition) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from stylebook where GOODS_NO=? order by ";
		List<StyleBookDTO> list = new ArrayList<StyleBookDTO>();

		try {

			if (sortCondition != null) {
				sql = this.addSortCondition(sql, sortCondition);
			}

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			rs = ps.executeQuery();

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
	public StyleBookDTO selectStyleBookByBoardRegNo(int boardRegNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from STYLEBOOK where BOARD_REG_NO=?";
		StyleBookDTO stylebook = null;

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				stylebook = new StyleBookDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
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
		String sql = "update STYLEBOOK set BOARD_CONTENT=?, FNAME=? where BOARD_REG_NO=?";
		int result = 0;

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, styleBook.getBoardContent());
			ps.setString(2, styleBook.getfName());
			ps.setInt(3, styleBook.getBoardRegNo());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

}
