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
		
		String sql = "UPDATE SELL SET SELL_PRICE = ? WHERE SELL_NO = ?";
		BidDAO bidDAO = new BidDAOImpl();
		OrderDAO orderDAO = new OrderDAOImpl();
		AlarmDAO alarmDAO = new AlarmDAOImpl();
		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);
			
			int goodsNo = selectGoodsNoBySellNo(con ,sellDTO.getSellNo());
			
			System.out.println("goodsNo = "+goodsNo);
			
			BidDTO bidDTO = bidDAO.getHighestBidPrice(goodsNo);
			
			
			
			if(this.priceCompare(bidDTO, sellDTO.getSellPrice())) {//최고입찰가를 받아 비교 후 true일 경우 주문등록(즉시판매)
				OrderDTO orderDTO = new OrderDTO(sellDTO.getSellNo(), bidDTO.getBidNo(), bidDTO.getBidPrice(), sellDTO.getUserId(), bidDTO.getUserId());
				
				result = orderDAO.insertOrder(con, orderDTO);
				if (result==0) {
					con.rollback();
					throw new SQLException("");
				} else {
					int result1 = UpdateSellStatusComplete(sellDTO.getSellNo());
					int result2 = bidDAO.updateBidStatus(bidDTO.getBidNo());
					if (result1==0 || result2==0) {
						con.rollback();
						throw new SQLException("");
					}
					
					int result4 = alarmDAO.insertAlarm(new AlarmDTO(goodsNo, "알람등록","주문이 성사됐습니다.")); 
					if(result4 == 0) {
						con.rollback();
						throw new SQLException("");
					}
					con.commit();
				}	
				return result;
			}else {
				
				compareSellLowerPrice(goodsNo,sellDTO);
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
	public int updateSellStatus(SellDTO sellDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "UPDATE SELL SET SELL_STATUS=? WHERE SELL_NO = ?";
		BidDAO bidDAO = new BidDAOImpl();
		OrderDAO orderDAO = new OrderDAOImpl();
		AlarmDAO alarmDAO = new AlarmDAOImpl();
		try {
			
			con = DbUtil.getConnection();
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);	
			
			int goodsNo = selectGoodsNoBySellNo(con ,sellDTO.getSellNo());
			BidDTO bidDTO = bidDAO.getHighestBidPrice(goodsNo); //null일때 제어
			
			if(sellDTO.getSellStatus().equals("판매중")) {		
				if(this.priceCompare(bidDTO, sellDTO.getSellPrice())) {//최고입찰가를 받아 비교 후 true일 경우 주문등록(즉시판매)
					OrderDTO orderDTO = new OrderDTO(sellDTO.getSellNo(), bidDTO.getBidNo(), bidDTO.getBidPrice(), sellDTO.getUserId(), bidDTO.getUserId());
					
					result = orderDAO.insertOrder(con, orderDTO);
					
					if (result==0) {
						con.rollback();
						throw new SQLException("");
					} else {
						int result1 = UpdateSellStatusComplete(sellDTO.getSellNo());
						int result2 = bidDAO.updateBidStatus(bidDTO.getBidNo());
						
						if (result1==0 || result2==0) {
							con.rollback();
							throw new SQLException("");
						}
						int result4 = alarmDAO.insertAlarm(new AlarmDTO(goodsNo, "알람등록","주문이 성사됐습니다.")); 
						if(result4 == 0) {
							con.rollback();
							throw new SQLException("");
						}
					}	
					return result;
				}else {
					compareSellLowerPrice(goodsNo, sellDTO);//goodsNo, price를
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
		String sql = "SELECT S.SELL_NO, S.USER_ID, G.GOODS_NAME, S.SELL_PRICE, S.PUR_DATE, S.SERIAL_NUMBER, S.SELL_DATE, S.SELL_STATUS \r\n"
				+ "FROM SELL S, GOODS G \r\n"
				+ "WHERE S.GOODS_NO = G.GOODS_NO ORDER BY S.SELL_STATUS ASC";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println("나오니?");
			while (rs.next()) {
				SellDTO sellDTO = new SellDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
				
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
		String sql = "SELECT G.GOODS_NAME, G.BRAND, S.SELL_PRICE, S.SELL_DATE, S.SELL_NO  \r\n"
					+ "FROM SELL S, GOODS G\r\n"
					+ "WHERE S.GOODS_NO = G.GOODS_NO AND S.USER_ID =? AND S.SELL_STATUS='판매중'";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				GoodsDTO goodsDTO= new GoodsDTO(rs.getString(1), rs.getString(2));
				
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
		List<SellDTO> sellList = new ArrayList<SellDTO>();
		String sql = "SELECT G.GOODS_NAME, G.BRAND, S.SELL_PRICE, S.SELL_DATE, S.SELL_NO  \r\n"
					+ "FROM SELL S, GOODS G\r\n"
					+ "WHERE S.GOODS_NO = G.GOODS_NO AND S.USER_ID =? AND S.SELL_STATUS= '판매대기' ";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				GoodsDTO goodsDTO= new GoodsDTO(rs.getString(1), rs.getString(2));
				
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
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return result;
	}
	
	private void compareSellLowerPrice(int goodsNo, SellDTO sellDTO) throws SQLException {
		
		SellDTO lowest = this.selectLowestPriceByGoodsNo(goodsNo);
		if (lowest == null) {
			return;
		}
		
		if (lowest.getSellPrice() > sellDTO.getSellPrice()) {
			// 알림 발송 (알림 내용 정하기)
			// 화면에 입찰 최고가 바꾸기
		}
	}
}
