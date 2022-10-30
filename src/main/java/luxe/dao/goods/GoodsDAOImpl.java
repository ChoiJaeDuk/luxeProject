package luxe.dao.goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dao.bid.BidDAO;
import luxe.dao.bid.BidDAOImpl;
import luxe.dao.goodsImages.GoodsImagesDAO;
import luxe.dao.goodsImages.GoodsImagesDAOImpl;
import luxe.dao.sell.SellDAO;
import luxe.dao.sell.SellDAOImpl;
import luxe.dao.wishlist.WishListDAO;
import luxe.dao.wishlist.WishListDAOImpl;
import luxe.dto.GoodsDTO;
import luxe.dto.GoodsImagesDTO;
import luxe.util.DbUtil;

public class GoodsDAOImpl implements GoodsDAO {
	WishListDAO wishListDAO = new WishListDAOImpl();
	GoodsImagesDAO goodsimgDAO = new GoodsImagesDAOImpl();
	/**
	 * 상품 등록 --> 이미지 등록까지 수정
	 * 
	 * @throws SQLException
	 */
	@Override
	public int insertGoods(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into goods values(goods_no_seq.nextval,?,?,?,?,current_date,0,?,TO_DATE(?),?)";

		
		
		int result = 0;
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql);
			System.out.println(goodsDTO.getGoodsModelNo());
			ps.setString(1, goodsDTO.getBrand());
			ps.setString(2, goodsDTO.getCategory());
			ps.setString(3, goodsDTO.getGoodsName());
			ps.setString(4, goodsDTO.getGoodsNameKor());
			ps.setString(5, goodsDTO.getGoodsModelNo());
			
			ps.setString(6, goodsDTO.getGoodsReleaseDate());
			ps.setInt(7, goodsDTO.getGoodsReleasePrice());

			result = ps.executeUpdate();
			result = goodsimgDAO.insertImages(con, goodImagesDTO);
			if (result == 0) {
				con.rollback();
				throw new SQLException("상품등록에 실패했습니다");
			}
			con.commit();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	/**
	 * 전체 상품목록 조회 brand = ex) "WHERE BRAND = '????'
	 */
	@Override
	public List<GoodsDTO> selectAllGoods(String brand, String category, String sort, String userId, String search) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "SELECT I.GOODS_MAIN_IMG, GOODS_NAME, GOODS_NAME_KOR, G.BRAND, G.CATEGORY, S.SELL_PRICE, G.GOODS_NO \r\n"
				+ "FROM GOODS G LEFT OUTER JOIN GOODS_IMAGES I \r\n"
				+ "ON G.GOODS_NO = I.GOODS_NO LEFT OUTER JOIN WISH_LIST W\r\n"
				+ "ON G.GOODS_NO = W.GOODS_NO LEFT OUTER JOIN (SELECT MIN(SELL_PRICE) AS SELL_PRICE, GOODS_NO FROM SELL GROUP BY GOODS_NO) S\r\n"
				+ "ON G.GOODS_NO = S.GOODS_NO\r\n"
				+ "WHERE G.GOODS_NAME LIKE "+ search +" OR G.GOODS_NAME_KOR LIKE " + search
				+ " GROUP BY I.GOODS_MAIN_IMG, GOODS_NAME, GOODS_NAME_KOR, G.BRAND, G.CATEGORY, G.GOODS_DATE, S.SELL_PRICE, G.GOODS_NO HAVING BRAND LIKE "
				+ brand + "AND category LIKE " + category + sort;
		System.out.println(sql);
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				GoodsDTO goodsDTO= new GoodsDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getInt(7));
				//추가되는 상품의 좋아요 여부...
				if(userId!=null) {
			        goodsDTO.setGoodsLikeByUser(wishListDAO.selectWishState(goodsDTO.getGoodsNo(), userId));// 0이면 dislike, 1이면 like
				}
				
				list.add(goodsDTO);
				
				
			}
			
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	/**
	 * 상품 상세 조회
	 */
	@Override
	public GoodsDTO selectGoodsLine(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT G.BRAND, G.GOODS_NAME, G.GOODS_NAME_KOR, G.CATEGORY, G.GOODS_MODEL_NO, G.GOODS_RELEASE_DATE, G.GOODS_RELEASE_PRICE,\n"
				+ "I.GOODS_MAIN_IMG, I.GOODS_IMG1, I.GOODS_IMG2, I.GOODS_IMG3, I.GOODS_IMG4\n"
				+ "FROM GOODS G, GOODS_IMAGES I\n" + "WHERE G.GOODS_NO = I.GOODS_NO AND G.GOODS_NO =? ";
		GoodsDTO goodsDTO = new GoodsDTO();
		SellDAO sellDAO = new SellDAOImpl();
		BidDAO bidDAO = new BidDAOImpl();
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			rs = ps.executeQuery();

			while (rs.next()) {
				int sellLowestPrice;
				int bidHighestPrice;
				if(sellDAO.selectLowestPriceByGoodsNo(goodsNo)==null ) {
					sellLowestPrice = 0;
				}else {
					sellLowestPrice = sellDAO.selectLowestPriceByGoodsNo(goodsNo).getSellPrice();
				}
				
				if(bidDAO.getHighestBidPrice(goodsNo)==null) {
					bidHighestPrice = 0;
				}else {
					bidHighestPrice = bidDAO.getHighestBidPrice(goodsNo).getBidPrice();
				}
				
				GoodsImagesDTO goodsImagesDTO = new GoodsImagesDTO(rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12));
				goodsDTO = new GoodsDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), goodsNo, sellLowestPrice, bidHighestPrice,goodsImagesDTO);

			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return goodsDTO;
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
	 * 상품명으로 상품 검색 // --> 메인이미지, 상품명, 상품 한글 상품명, 가격 , 브랜드, 카테고리
	 */
	@Override
	public List<GoodsDTO> selectGoodsByGoodsName(String goodsName) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();

		String sql = "select * from goods where upper(goods_name) like upper(?) or goods_name_kor like ? or category like ?";

		try {
			con = DbUtil.getConnection();
			System.out.println(goodsName);
			ps = con.prepareStatement(sql);
			
			ps.setString(1, goodsName+"%");
			ps.setString(2, goodsName+"%");
			ps.setString(3, goodsName+"%");
			rs = ps.executeQuery();

			while(rs.next()) {
				list.add(new GoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10)));
			}
			
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	/**
	 * 상품 수정
	 */
	@Override
	public int updateGoodsDTO(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "update goods" + " set goods_no=?, brand = ?, category = ?,  goods_name = ?, goods_name_kor =?, "
				+ "goods_date = ?, goods_read_no=?, goods_model_no =?, goods_release_date=?, goods_release_price=?"
				+ "where goods_no";

		GoodsImagesDAO goodsimgDAO = new GoodsImagesDAOImpl();

		int result = 0;
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsDTO.getGoodsNo());
			ps.setString(2, goodsDTO.getBrand());
			ps.setString(3, goodsDTO.getCategory());
			ps.setString(4, goodsDTO.getGoodsName());
			ps.setString(5, goodsDTO.getGoodsNameKor());
			ps.setString(6, goodsDTO.getGoodsDate());
			ps.setString(7, goodsDTO.getGoodsModelNo());
			ps.setString(8, goodsDTO.getGoodsReleaseDate());
			ps.setInt(9, goodsDTO.getGoodsReleasePrice());

			result = goodsimgDAO.insertImages(con, goodImagesDTO);
			if (result == 0) {
				con.rollback();
				throw new SQLException("상품 수정에 실패했습니다");
			}
			
			result = ps.executeUpdate();
			con.commit();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;

	}

	/**
	 * 상품 삭제
	 */
	@Override
	public int deleteGoodsDTO(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		String sql = "delete from goods where goods_no=?";
		GoodsImagesDAO goodsimgDAO = new GoodsImagesDAOImpl();

		int result = 0;

		try {

			con = DbUtil.getConnection();
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);

			result = goodsimgDAO.deleteGoodsNoImgs(con, goodsNo);
			if (result == 0) {
				con.rollback();
				throw new SQLException("상품 삭제를 실패했습니다.");
			}

			result = ps.executeUpdate();
			con.commit();
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

}
