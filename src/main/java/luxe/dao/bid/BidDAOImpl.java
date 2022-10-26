package luxe.dao.bid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dao.alarm.AlarmDAO;
import luxe.dao.alarm.AlarmDAOImpl;
import luxe.dao.order.OrderDAO;
import luxe.dao.order.OrderDAOImpl;
import luxe.dao.sell.SellDAO;
import luxe.dao.sell.SellDAOImpl;
import luxe.dto.AlarmDTO;
import luxe.dto.BidDTO;
import luxe.dto.OrderDTO;
import luxe.dto.SellDTO;
import luxe.util.DbUtil;

public class BidDAOImpl implements BidDAO {
	private SellDAO sellDao = new SellDAOImpl();
	private OrderDAO orderDao = new OrderDAOImpl();
	private AlarmDAO alarmDao = new AlarmDAOImpl();

	@Override
	public List<BidDTO> selectAllBid() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select bid_no, goods_name, brand, bid_price, TO_CHAR(bid_regdate, 'YYYY-MM-DD') from bid b join goods g on b.goods_no=g.goods_no group by goods_name, brand, bid_price, bid_regdate, bid_no order by bid_no";
		List<BidDTO> list = new ArrayList<BidDTO>();

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new BidDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public List<BidDTO> selectAllBidByUserId(String userId, String bidState) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select bid_no, goods_name, brand, bid_price, TO_CHAR(bid_regdate, 'YYYY-MM-DD') from bid b join goods g on b.goods_no=g.goods_no and user_id=? and bid_status like ? group by goods_name, brand, bid_price, bid_regdate, bid_no, user_id order by bid_no";
		List<BidDTO> list = new ArrayList<BidDTO>();

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, bidState);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new BidDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public int insertBid(BidDTO bid) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		SellDTO lowestSell = null;
		String sql = "insert into BID values(BID_NO_SEQ.NEXTVAL, ?, ?, ?, ?, CURRENT_DATE)";

		int result = 0;

		try {
			con = DbUtil.getConnection();
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql);

			int goodsNo = bid.getGoodsNo(); // 상품 번호
			int bidPrice = bid.getBidPrice(); // 입찰 가격
			String bidStatus = ""; // 입찰 상태

			lowestSell = sellDao.selectLowestPriceByGoodsNo(goodsNo); // 판매 최저가
			boolean isOnGoing = this.isOnGoingBid(goodsNo, bidPrice, lowestSell);

			if (isOnGoing)
				bidStatus = "입찰중";
			else
				bidStatus = "입찰완료";

			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			ps.setString(2, bid.getUserId());
			ps.setInt(3, bidPrice);
			ps.setString(4, bidStatus);
			result = ps.executeUpdate();

			// 입찰 등록 후 알람 발송 또는 주문 등록
			if (result != 0) {
				if (isOnGoing) { // 입찰중
					// 입찰 최고가 비교
					this.compareHigherPrice(goodsNo, bidPrice);
				} else {
					// 주문 호출
					this.callOrder(con, bid, lowestSell);
				}
			}

		} finally {
			con.commit();
			DbUtil.dbClose(con, ps);
		}

		return result;
	}

	/**
	 * 판매 최저가와 입찰가 비교: true면 입찰중, false면 즉시 구매
	 */
	private boolean isOnGoingBid(int goodsNo, int bidPrice, SellDTO lowestSell) throws SQLException {
		boolean result = true;
		if (lowestSell != null) {
			// 판매 최저가와 입찰가 비교
			int lowestSellPrice = lowestSell.getSellPrice(); // 판매 최저가
			if (bidPrice == lowestSellPrice)
				result = false;
		}
		return result;
	}

	/**
	 * 상품 번호 해당 최고가 입찰 조회
	 */
	public BidDTO getHighestBidPrice(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select bid_no, user_id, bid_price from bid where goods_no=? AND bid_status='입찰중' and bid_price=(select max(bid_price) from bid where goods_no=? AND bid_status='입찰중')";

		BidDTO highestBid = null;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			ps.setInt(2, goodsNo);
			rs = ps.executeQuery();

			if (rs.next())
				highestBid = new BidDTO(rs.getInt(1), goodsNo, rs.getString(2), rs.getInt(3), null, null); // 입찰 번호 넘기기

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return highestBid;
	}

	/**
	 * 입찰 최고가 비교 후 true이면 알림 발송
	 */
	private void compareHigherPrice(int goodsNo, int bidPrice) throws SQLException {
		BidDTO highest = this.getHighestBidPrice(goodsNo);
		if (highest != null) {
			if (highest.getBidPrice() < bidPrice) {
				alarmDao.insertAlarm(new AlarmDTO(0, goodsNo, "제목", "내용", null));
				// 화면에 입찰 최고가 바꾸기
			}
		} else {
			alarmDao.insertAlarm(new AlarmDTO(0, goodsNo, "제목", "내용", null));
			// 화면에 입찰 최고가 바꾸기
		}
	}

	/**
	 * 주문 호출 메소드
	 */
	private void callOrder(Connection con, BidDTO bid, SellDTO lowestSell) throws Exception {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select BID_NO from bid where USER_ID=? and GOODS_NO=?";
		int bidNo = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, bid.getUserId());
			ps.setInt(2, bid.getGoodsNo());
			rs = ps.executeQuery();

			if (rs.next())
				bidNo = rs.getInt(1);

			OrderDTO newOrder = new OrderDTO(lowestSell.getSellNo(), bidNo, bid.getBidPrice(), bid.getUserId(),
					lowestSell.getUserId());
			int result = orderDao.insertOrder(con, newOrder);
			if (result != 0) {
				// 주문 상태 변경
				int sellStatusResult = sellDao.UpdateSellStatusComplete(lowestSell.getSellNo());
				if (sellStatusResult == 0) {
					con.rollback();
					throw new SQLException("판매 상태 변경에 실패했습니다.");
				}

			} else {
				con.rollback();
				throw new SQLException("주문 등록에 실패했습니다."); // 메세지 확인
			}

		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
	}

	/**
	 * 중복 체크
	 */
	@Override
	public BidDTO checkDuplicatedBid(BidDTO bid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from BID where USER_ID=? and GOODS_NO=?";
		BidDTO dbBid = null;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, bid.getUserId());
			ps.setInt(2, bid.getGoodsNo());
			rs = ps.executeQuery();

			if (rs.next())
				dbBid = new BidDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6));

		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
		return dbBid;
	}

	@Override
	public int updateBidPrice(BidDTO bid) throws Exception {
		Connection con = null;
		PreparedStatement ps = null;
		SellDTO lowestSell = null;
		int result = 0;
		String sql = "update bid set BID_PRICE=?, BID_STATUS=? where USER_ID=? and bid_No=?";

		try {

			int goodsNo = bid.getGoodsNo(); // 상품번호
			int bidPrice = bid.getBidPrice(); // 입찰 가격
			String bidStatus = ""; // 입찰 상태
			lowestSell = sellDao.selectLowestPriceByGoodsNo(goodsNo); // 판매 최저가
			boolean isOnGoing = this.isOnGoingBid(goodsNo, bidPrice, lowestSell);

			if (isOnGoing)
				bidStatus = "입찰중";
			else
				bidStatus = "입찰완료";

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bidPrice);
			ps.setString(2, bidStatus);
			ps.setString(3, bid.getUserId());
			ps.setInt(4, bid.getBidNo());
			result = ps.executeUpdate();

			// 입찰 등록 후 알람 발송 또는 주문 등록
			if (result != 0) {
				if (isOnGoing) { // 입찰중
					// 입찰 최고가 비교
					this.compareHigherPrice(goodsNo, bidPrice);
				} else {
					// 주문 호출
					this.callOrder(con, bid, lowestSell);
				}
			}
		} finally {
			DbUtil.dbClose(con, ps);

		}
		return result;
	}

	@Override
	public int updateBidStatus(int bidNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update bid set BID_STATUS='입찰완료' where BID_NO=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bidNo);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

	@Override
	public int deleteBid(int bidNo, String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "delete from bid where BID_NO=? and USER_ID=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, bidNo);
			ps.setString(2, userId);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

}
