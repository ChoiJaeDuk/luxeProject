package luxe.dao.wishlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.SellDTO;
import luxe.dto.WishListDTO;
import luxe.util.DbUtil;

public class WishListDAOImpl implements WishListDAO {

	@Override
	public int insertWishList(WishListDTO wishListDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "INSERT INTO WISH_LIST VALUES(WISH_LIST_NO_SEQ.NEXTVAL, ?, ?)";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, wishListDTO.getUserId());
			ps.setInt(2, wishListDTO.getGoodsNo());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;
	}

	@Override
	public int deleteWishList(int wishListNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "DELETE FROM WISH_LIST WHERE WISH_LIST_NO = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, wishListNo);

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;
	}

	@Override
	public List<WishListDTO> selectWishList(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<WishListDTO> wishList = new ArrayList<WishListDTO>();
		String sql = "SELECT  G.BRAND, G.GOODS_NAME, G.GOODS_NAME_KOR , G.CATEGORY, I.GOODS_MAIN_IMG\r\n"
				+ "FROM WISH_LIST W, GOODS G, GOODS_IMAGES I\r\n"
				+ "WHERE W.GOODS_NO = G.GOODS_NO AND W.GOODS_NO = I.GOODS_NO AND\r\n"
				+ "W.USER_ID = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				
				WishListDTO wishListDTO = new WishListDTO();
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return wishList;
	}

}
