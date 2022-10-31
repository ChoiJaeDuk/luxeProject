package luxe.dao.goodsImages;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import luxe.dto.GoodsImagesDTO;
import luxe.util.DbUtil;

public class GoodsImagesDAOImpl implements GoodsImagesDAO {

	/**
	 * 이미지 등록
	 */
	@Override
	public int insertImages(Connection con, GoodsImagesDTO goodsImgs) throws SQLException {
		PreparedStatement ps = null;
		String sql = "insert into goods_images values(GOODS_NO_SEQ.CURRVAL,?,?,?,?,?)";
		int result = 0;

		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, goodsImgs.getGoodsMainImg());
			ps.setString(2, goodsImgs.getGoodsImg1());
			ps.setString(3, goodsImgs.getGoodsImg2());
			ps.setString(4, goodsImgs.getGoodsImg3());
			ps.setString(5, goodsImgs.getGoodsImg4());

			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(null, ps);
		}
		return result;
	}

	/**
	 * 이미지 수정
	 */
	@Override
	public int updateImages(String updateImg, int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "UPDATE GOODS_IMAGES SET " + updateImg +" WHERE GOODS_NO = ?";
		int result = 0;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, goodsNo);
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int deleteGoodsNoImgs(Connection con, int goodsNo) throws SQLException {
		
		PreparedStatement ps = null;
		String sql = "delete from goods_images where goods_no=?";
		int result = 0;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);

			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(null, ps);
		}
		return result;
	}

	@Override
	public String selectMainImgByGoodsNo(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String goodsMainImg = null;

		String sql = "SELECT GOODS_MAIN_IMG FROM GOODS_IMAGES WHERE GOODS_NO = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
		

			rs = ps.executeQuery();
			if (rs.next())
				goodsMainImg = rs.getString(1);
		} finally {
			DbUtil.dbClose(con, ps, rs);

		}
		return goodsMainImg;
	}
	
}
