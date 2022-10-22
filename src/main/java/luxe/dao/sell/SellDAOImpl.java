package luxe.dao.sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.sell.SellDTO;
import luxe.util.DbUtil;

public class SellDAOImpl implements SellDAO {

	@Override
	public int insertSell(SellDTO sell) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "INSERT INTO SELL VALUES(SELL_NO_SEQ.NEXTVAL, ?, ?, ?,'신청대기', ?,CURRENT_DATE , TO_DATE(?),?)";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, sell.getGoodsNo());
			ps.setString(2, sell.getUserId());
			ps.setString(3, sell.getAccountNo());
			ps.setInt(4, sell.getSellPrice());
			ps.setString(5, sell.getPurdate());
			ps.setString(6, sell.getSerial_number());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;
	}
	
	
	public int updateSellPrice(int sellNo, int updateSellPirce) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "UPDATE SELL SET SELL_PRICE = ? WHERE SELL_NO = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, updateSellPirce);
			ps.setInt(2, sellNo);
			result = ps.executeUpdate();
			
			//최고입찰가를 받아 비교 후 true일 경우 주문등록
			if(this.priceCompare(sellNo, 최고입찰가/*bidDTO로 받아야한다.*/)) {
				
			}
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}
	

	@Override
	public int updateSellStatus(int sellNo, String sellStatus) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "UPDATE SELL SET SELL_STATUS=? WHERE SELL_NO = ?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, sellStatus);
			ps.setInt(2, sellNo);
			result = ps.executeUpdate();
			
			//최고입찰가를 받아 비교 후 true일 경우 주문등록
			if(sellStatus.equals("판매중")) {
				if(this.priceCompare(sellNo, 최고입찰가/*bidDTO로 받아야한다.*/)) {
					
				}
			}
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	
	@Override
	public List<SellDTO> selectSellingInfoByUserId(String userId ) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<SellDTO> sellList = new ArrayList<SellDTO>();
		String sql = "SELECT G.GOODS_NAME, G.BRAND, S.SELL_PRICE, S.SELL_DATE  \r\n"
					+ "FROM SELL S, GOODS G\r\n"
					+ "WHERE S.GOODS_NO = G.GOODS_NO AND S.USER_ID =? AND S.SELL_STATUS='판매중' ";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				GoodsDTO goodsDTO= new GoodsDTO(rs.getString(1), rs.getString(2));
				
				sellList.add(new SellDTO(rs.getInt(3), rs.getString(4), goodsDTO));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return sellList;
	}

	@Override
	public List<SellDTO> selectSellWaitInfoByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<SellDTO> sellList = new ArrayList<SellDTO>();
		String sql = "SELECT G.GOODS_NAME, G.BRAND, S.SELL_PRICE, S.SELL_DATE  \r\n"
					+ "FROM SELL S, GOODS G\r\n"
					+ "WHERE S.GOODS_NO = G.GOODS_NO AND S.USER_ID =? AND S.SELL_STATUS= '신청대기' ";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				GoodsDTO goodsDTO= new GoodsDTO(rs.getString(1), rs.getString(2));
				
				sellList.add(new SellDTO(rs.getInt(3), rs.getString(4), goodsDTO));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return sellList;
	}
	
	@Override
	public SellDTO selectMaxPriceByGoodsNo(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SellDTO sellDTO = null;
		String sql = "SELECT USER_ID, MIN(SELL_PRICE) FROM SELL GROUP BY USER_ID, GOODS_NO, SELL_STATUS HAVING GOODS_NO = ? AND SELL_STATUS='판매중' ";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,goodsNo);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				sellDTO = new SellDTO(rs.getString(1), rs.getInt(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return sellDTO;
	}
	
	
	@Override
	public boolean priceCompare(int 입찰최고가/*bidDTO로 받을까?*/, int goodsNo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		String sql = "SELECT SELL_NO FROM SELL WHERE GOODS_NO=? AND SELL_PRICE=? AND SELL_STATUS = '판매중';";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			ps.setInt(2, 입찰최고가);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}

}
