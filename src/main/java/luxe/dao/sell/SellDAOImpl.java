package luxe.dao.sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dao.bid.BidDAO;
import luxe.dao.bid.BidDAOImpl;
import luxe.dao.order.OrderDAO;
import luxe.dao.order.OrderDAOImpl;
import luxe.dto.BidDTO;
import luxe.dto.GoodsDTO;
import luxe.dto.OrderDTO;
import luxe.dto.SellDTO;
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
			ps.setString(6, sell.getSerialNumber());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;
	}
	
	
	@Override
	public int updateSellPrice(SellDTO sellDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "UPDATE SELL SET SELL_PRICE = ?, SELL_STATUS = ? WHERE SELL_NO = ?";
		BidDAO bidDAO = new BidDAOImpl();
		OrderDAO orderDAO = new OrderDAOImpl();
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			int goodsNo = selectGoodsNoBySellNo(con ,sellDTO.getSellNo());
			BidDTO bidDTO = bidDAO.getHighestBidPrice(goodsNo);
		
			if(priceCompare(con, bidDTO, goodsNo)) {//최고입찰가를 받아 비교 후 true일 경우 주문등록(즉시판매)
				OrderDTO orderDTO = new OrderDTO(sellDTO.getSellNo(), bidDTO.getBidNo(), bidDTO.getBidPrice(),sellDTO.getUserId(), bidDTO.getUserId());
				orderDAO.insertOrder(con, orderDTO);//주문등록
				
				result = UpdateSellStatusComplete(sellDTO.getSellNo());
				//입찰완료 메소드 호출
				
				//나중 업데이트에 최고 입찰가가 변하지 않는다면 알림전송 x를 제어한다.
				//알림전송
				return result;
			}else {//즉시판매가 아닌경우
				compareSellLowerPrice(sellDTO);
			}
			ps.setInt(1, sellDTO.getSellPrice());
			ps.setString(2, sellDTO.getSellStatus());
			ps.setInt(3, sellDTO.getSellNo());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}
	
	
	
	@Override
	public int updateSellStatus(SellDTO sellDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "UPDATE SELL SET SELL_STATUS=? WHERE SELL_NO = ?";
		BidDAO bidDAO = new BidDAOImpl();
		OrderDAO orderDAO = new OrderDAOImpl();
		try {
			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			int goodsNo = selectGoodsNoBySellNo(con ,sellDTO.getSellNo());
			BidDTO bidDTO = bidDAO.getHighestBidPrice(goodsNo);
			
			if(sellDTO.getSellStatus().equals("판매중")) {				
				if(priceCompare(con,bidDTO, goodsNo)) {//최고입찰가를 받아 비교 후 true일 경우 주문등록(즉시판매)
					OrderDTO orderDTO = new OrderDTO(sellDTO.getSellNo(), bidDTO.getBidNo(), bidDTO.getBidPrice(), sellDTO.getUserId(), bidDTO.getUserId());
					orderDAO.insertOrder(con, orderDTO);
					result = UpdateSellStatusComplete(sellDTO.getSellNo());
					//입찰완료로 바꾸자~!

					//알림까지 뿌려~~
					return result;
				}else {
					compareSellLowerPrice(sellDTO);
				}
			}
			ps.setString(1, sellDTO.getSellStatus());
			ps.setInt(2, sellDTO.getSellNo());
			result = ps.executeUpdate();
		
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	
	
	public List<SellDTO> selectSellAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<SellDTO> sellList = new ArrayList<SellDTO>();
		String sql = "SELECT S.SELL_NO, S.USER_ID, G.GOODS_NAME, S.SELL_PRICE, S.PUR_DATE, S.SERIAL_NUMBER, S.SELL_DATE, S.SELL_STATUS\r\n"
				+ "FROM SELL S, GOODS G WHERE S.GOODS_NO = G.GOODS_NO ORDER BY S.SELL_STATUS ASC";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				SellDTO sellDTO = new SellDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(8),rs.getString(9));
				
				sellList.add(sellDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return sellList;
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
	public SellDTO selectLowestPriceByGoodsNo(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SellDTO sellDTO = null;
		String sql = "SELECT USER_ID, MIN(SELL_PRICE), SELL_NO FROM SELL GROUP BY USER_ID, GOODS_NO, SELL_STATUS, SELL_NO HAVING GOODS_NO = ? AND SELL_STATUS='판매중' ORDER BY SELL_NO ASC";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,goodsNo);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				sellDTO = new SellDTO(goodsNo ,rs.getString(1), rs.getInt(2), rs.getInt(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return sellDTO;
	}
	
	/**
	 * 값비교
	 */
	private boolean priceCompare(Connection con, BidDTO bidDTO, int goodsNo) throws SQLException{
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		String sql = "SELECT SELL_NO FROM SELL WHERE GOODS_NO=? AND SELL_PRICE=? AND SELL_STATUS = '판매중'";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			ps.setInt(2, bidDTO.getBidPrice());
			rs = ps.executeQuery();
			
			result = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
		return result;
	}
	
	
	private int selectGoodsNoBySellNo(Connection con, int sellNo) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		int goodsNo = 0;
		String sql = "SELECT GOODS_NO FROM SELL WHERE SELL_NO=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, sellNo);
		
			rs = ps.executeQuery();
			
			if(rs.next()) {
				goodsNo = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
		return goodsNo;
	}
	
	
	public int UpdateSellStatusComplete(int sellNo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "UPDATE SELL SET SELL_STATUS = '판매완료' WHERE SELL_NO = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, sellNo);
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}
	
	
	public boolean sellDuplicateCheck(SellDTO sellDTO) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		String sql = "SELECT SELL_NO FROM SELL WHERE SERIAL_NUMBER = ? AND USER_ID = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, sellDTO.getSerialNumber());
			ps.setString(2, sellDTO.getUserId());
			rs = ps.executeQuery();
		 
			result = rs.next();
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}
	
	private void compareSellLowerPrice(SellDTO sellDTO) throws SQLException {
		SellDTO lowest = this.selectLowestPriceByGoodsNo(sellDTO.getGoodsNo());
		
		if (lowest.getSellPrice() > sellDTO.getSellPrice()) {
			// 알림 발송 (알림 내용 정하기)
			// 화면에 입찰 최고가 바꾸기
		}
	}
}
