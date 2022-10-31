package luxe.dao.sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dao.alarm.AlarmDAO;
import luxe.dao.alarm.AlarmDAOImpl;
import luxe.dao.bid.BidDAO;
import luxe.dao.bid.BidDAOImpl;
import luxe.dao.order.OrderDAO;
import luxe.dao.order.OrderDAOImpl;
import luxe.dto.AlarmDTO;
import luxe.dto.BidDTO;
import luxe.dto.GoodsDTO;
import luxe.dto.OrderDTO;
import luxe.dto.SellDTO;
import luxe.util.DbUtil;

public class SellDAOImpl implements SellDAO {
	AlarmDAO alarmDAO = new AlarmDAOImpl();

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
	public int updateSellPrice(SellDTO sellDTO) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "UPDATE SELL SET SELL_PRICE = ? WHERE SELL_NO = ?";
		BidDAO bidDAO = new BidDAOImpl();
		OrderDAO orderDAO = new OrderDAOImpl();
		
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			
			int goodsNo = selectGoodsNoBySellNo(con ,sellDTO.getSellNo());
			
			
			BidDTO bidDTO = bidDAO.getHighestBidPrice(goodsNo);//최고입찰가 , 해당 유저ID, 입찰번호를 받는다.
			
			
			if(this.priceCompare(bidDTO, sellDTO.getSellPrice())) {//최고입찰가와 판매가격을 비교 후 true일 경우 주문등록(즉시판매)
				System.out.println("USER_ID = "+bidDTO.getUserId());
				System.out.println("USER_ID = "+sellDTO.getUserId());
				OrderDTO orderDTO = new OrderDTO(sellDTO.getSellNo(), bidDTO.getBidNo(), bidDTO.getBidPrice(), bidDTO.getUserId(), sellDTO.getUserId());
				int result1 = UpdateSellStatusComplete(sellDTO.getSellNo());
				int result2 = bidDAO.updateBidStatus(bidDTO.getBidNo());
				result = orderDAO.insertOrder(con, orderDTO);
				if (result==0||result1==0 || result2==0) {
					con.rollback();
					throw new SQLException("");
				} 
				return result;
			}else {
				
				compareSellLowerPrice(goodsNo,sellDTO.getSellPrice());
			}
			ps.setInt(1, sellDTO.getSellPrice());
			ps.setInt(2, sellDTO.getSellNo());
			
			result = ps.executeUpdate();
		} finally {
			con.commit();
			DbUtil.dbClose(con, ps);
		}
		return result;
	}
	
	
	
	@Override
	public int updateSellStatus(SellDTO sellDTO) throws Exception {
		System.out.println(sellDTO.getSellStatus());
		System.out.println(sellDTO.getSellNo());
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "UPDATE SELL SET SELL_STATUS=? WHERE SELL_NO = ?";
		BidDAO bidDAO = new BidDAOImpl();
		OrderDAO orderDAO = new OrderDAOImpl();
		
		try {
			
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);	
			
			int goodsNo = selectGoodsNoBySellNo(con ,sellDTO.getSellNo());
			BidDTO bidDTO = bidDAO.getHighestBidPrice(goodsNo); //null일때 제어
			
			if(sellDTO.getSellStatus().equals("판매중")) {	
				System.out.println("값비교 결과 :" + this.priceCompare(bidDTO, sellDTO.getSellPrice()));
				if(this.priceCompare(bidDTO, sellDTO.getSellPrice())) {//최고입찰가를 받아 비교 후 true일 경우 주문등록(즉시판매)
					OrderDTO orderDTO = new OrderDTO(sellDTO.getSellNo(), bidDTO.getBidNo(), bidDTO.getBidPrice(), bidDTO.getUserId(), sellDTO.getUserId());
					int result1 = UpdateSellStatusComplete(sellDTO.getSellNo());
					int result2 = bidDAO.updateBidStatus(bidDTO.getBidNo());
					result = orderDAO.insertOrder(con, orderDTO);
					
					if (result==0 || result1==0 || result2==0) {
						con.rollback();
						throw new SQLException("");
					}
					
					return result;
				}else {
					compareSellLowerPrice(goodsNo, sellDTO.getSellPrice());//goodsNo, price를
				}
			}
			
			ps.setString(1, sellDTO.getSellStatus());
			ps.setInt(2, sellDTO.getSellNo());

			result = ps.executeUpdate();
			
		} finally {
			con.commit();
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	
	
	public List<SellDTO> selectSellAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<SellDTO> sellList = new ArrayList<SellDTO>();
		String sql = "SELECT S.SELL_NO, S.USER_ID, G.BRAND, G.GOODS_NAME, S.SELL_PRICE, TO_CHAR(S.PUR_DATE, 'YY-MM-DD'), S.SERIAL_NUMBER, TO_CHAR(S.SELL_DATE, 'YY-MM-DD'), S.SELL_STATUS\r\n"
				+ "FROM SELL S, GOODS G \r\n"
				+ "WHERE S.GOODS_NO = G.GOODS_NO AND SELL_STATUS = '신청대기' ORDER BY S.SELL_STATUS ASC";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				SellDTO sellDTO = new SellDTO(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
				
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
		BidDAO bidDAO = new BidDAOImpl();
		String sql = "SELECT G.GOODS_NAME, G.BRAND, S.SELL_PRICE, S.SELL_DATE, S.SELL_NO, S.GOODS_NO  \r\n"
					+ "FROM SELL S, GOODS G\r\n"
					+ "WHERE S.GOODS_NO = G.GOODS_NO AND S.USER_ID =? AND S.SELL_STATUS='판매중'";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			int highestPrice;
			while (rs.next()) {
				BidDTO bidDTO = bidDAO.getHighestBidPrice(rs.getInt(6));
				if(bidDTO==null) {
					highestPrice = 0;
				}else {
					highestPrice = bidDTO.getBidPrice();
				}
				
				GoodsDTO goodsDTO= new GoodsDTO(rs.getString(1), rs.getString(2), highestPrice);
				
				sellList.add(new SellDTO(rs.getInt(3), rs.getString(4), rs.getInt(5), goodsDTO));
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
		BidDAO bidDAO = new BidDAOImpl();
		List<SellDTO> sellList = new ArrayList<SellDTO>();
		String sql = "SELECT G.GOODS_NAME, G.BRAND, S.SELL_PRICE, S.SELL_DATE, S.SELL_NO, S.GOODS_NO\r\n"
					+ "FROM SELL S, GOODS G\r\n"
					+ "WHERE S.GOODS_NO = G.GOODS_NO AND S.USER_ID =? AND S.SELL_STATUS= '신청대기' ";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			int highestPrice;
			while (rs.next()) {
				
				BidDTO bidDTO = bidDAO.getHighestBidPrice(rs.getInt(6));
				if(bidDTO==null) {
					highestPrice = 0;
				}else {
					highestPrice = bidDTO.getBidPrice();
				}
				 
				GoodsDTO goodsDTO= new GoodsDTO(rs.getString(1), rs.getString(2), highestPrice);
				
				sellList.add(new SellDTO(rs.getInt(3), rs.getString(4), rs.getInt(5), goodsDTO));
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
		String sql = "SELECT USER_ID, SELL_PRICE, SELL_NO "
				+ "FROM SELL "
				+ "WHERE GOODS_NO = ? AND SELL_STATUS='판매중' AND SELL_PRICE =(SELECT MIN(SELL_PRICE) FROM SELL WHERE GOODS_NO = ? AND SELL_STATUS='판매중' )";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,goodsNo);
			ps.setInt(2,goodsNo);
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
	private boolean priceCompare(BidDTO bidDTO, int sellPrice) throws SQLException{
		boolean result = false;
		
		if(bidDTO != null) {
			System.out.println(bidDTO.getBidPrice()+"최고가   등록가" + sellPrice );
			if(bidDTO.getBidPrice() == sellPrice) {
				result = true;
			}
		}
		return result;
	}
	
	
	/**
	 * SellNo를 통해 GoodsNo를 조회한다.
	 * @param con
	 * @param sellNo
	 * @return
	 * @throws SQLException
	 */
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
			System.out.println(sellDTO.getSerialNumber());
			System.out.println(sellDTO.getUserId());
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}
	
	private void compareSellLowerPrice(int goodsNo, int oldLowestPrice) throws SQLException {
		
		SellDTO lowest = this.selectLowestPriceByGoodsNo(goodsNo);
		if (lowest == null) {
			return;
		}
		
		if (lowest.getSellPrice() != oldLowestPrice) {
			// 알림 발송 (알림 내용 정하기)
			alarmDAO.insertAlarm(new AlarmDTO(goodsNo, "판매 최저가변경","판매 최저가가 변경되었습니다.")); 
		}
	}


	@Override
	public int deleteSell(int sellNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "DELETE FROM SELL WHERE SELL_NO = ?";

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
}
