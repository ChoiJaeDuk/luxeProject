package luxe.dao.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.GoodsDTO;
import luxe.util.DbUtil;

public class GoodsDAOImpl implements GoodsDAO {

	/**
	 * 상품 등록
	 */
	@Override
	public int insert(GoodsDTO goodsDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into goods values(goods_no_seq.nextval,?,?,?,?,current_date,?,?,?,?)";

		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsDTO.getBrand());
			ps.setString(2, goodsDTO.getCategory());
			ps.setString(3, goodsDTO.getGoodsName());
			ps.setString(4, goodsDTO.getGoodsNameKor());
			ps.setInt(6, goodsDTO.getGoodsReadNo());
			ps.setString(7, goodsDTO.getGoodsModelNo());
			ps.setInt(8, goodsDTO.getGoodsReleasePrice());

			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	/**
	 * 전체 상품목록 조회
	 */
	@Override
	public List<GoodsDTO> selectAllGoods() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from goods";
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new GoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10)));

			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	/**
	 * 조회수 증가
	 */
	@Override
	public int increaseGoodsReadNo(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "updatae goods set read_no=read_no+1 where goods_no=?";
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

	/**
	 * 브랜드별 조회
	 */
	@Override
	public List<GoodsDTO> goodsBrand(String brand) throws SQLException {

		return null;
	}

	/**
	 * 카테고리별 조회
	 */
	@Override
	public List<GoodsDTO> category(String category) throws SQLException {

		return null;
	}

	/**
	 * 인기순 조회
	 */
	@Override
	public List<GoodsDTO> selectWishlist() throws SQLException {

		return null;
	}

	/**
	 * 최신상품 순 조회
	 */
	@Override
	public List<GoodsDTO> selectGoodsReleaseDate(String goodsReleaseDate) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select*from goods order by goods_release_date desc";
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new GoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10)));

			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	/**
	 * 높은 가격 순 조회
	 */
	@Override
	public List<GoodsDTO> selectByGoodsHighPrice(int goodsReleasePrice) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select*from goods order by goods_release_price desc";
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new GoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10)));

			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	/**
	 * 낮은 가격 순 조회
	 */
	@Override
	public List<GoodsDTO> selectByGoodsRowPrice(int goodsReleasePrice) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select*from goods order by goods_release_price asc";
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new GoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10)));

			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	/**
	 * 상품명으로 상품 검색
	 */
	@Override
	public GoodsDTO selectGoodsByGoodsName(String goodsName) throws SQLException {

		GoodsDTO goods = null;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select * from goods where goods_name= ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsName);
			rs = ps.executeQuery();

			if (rs.next()) {
				goods = new GoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10));
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return goods;
	}

	/**
	 * 상품 수정
	 */
	@Override
	public int updateGoodsDTO(GoodsDTO goodsDTO) throws SQLException {

		return 0;
	}

	/**
	 * 상품 삭제
	 */
	@Override
	public int deleteGoodsDTO(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		String sql = "delete from goods where goods_no=?";

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

}
