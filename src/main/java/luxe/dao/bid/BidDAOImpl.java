package luxe.dao.bid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dao.sell.SellDAO;
import luxe.dao.sell.SellDAOImpl;
import luxe.dto.BidDTO;
import luxe.util.DbUtil;

public class BidDAOImpl implements BidDAO {
	private SellDAO sellDao = new SellDAOImpl();

	@Override
	public List<BidDTO> selectAllBid() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from BID";
		List<BidDTO> list = new ArrayList<BidDTO>();

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new BidDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6).toString()));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public List<BidDTO> selectAllBidByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from BID where USER_ID=?";
		List<BidDTO> list = new ArrayList<BidDTO>();

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new BidDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6).toString()));
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
		String sql = "select * from BID where USER_ID=?";
		List<BidDTO> list = new ArrayList<BidDTO>();

		try {

			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new BidDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getDate(6).toString()));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public int insertBid(BidDTO bid) throws SQLException {
		Connection con = DbUtil.getConnection();
		int result = 0;

		int lowestSellPrice = sellDao.selectMaxPriceByGoodsNo(bid.getGoodsNo()).getSellPrice();
		boolean isOnGoingBid = false;
		// 입찰 상태 설정
		if (bid.getBidPrice() == lowestSellPrice) {
			bid.setBidStatus("입찰완료"); // 즉시 구매
		} else {
			bid.setBidStatus("입찰중");
			isOnGoingBid = true;
		}
		// 최근 거래 내역 여부 확인
		if (this.isNewBid(con, bid.getUserId(), bid.getGoodsNo())) {
			result = this.insertNewBid(con, bid);
		} else {
			result = this.updateBid(con, bid);
		}

		// 입찰 등록 후 알람 발송 또는 주문 등록
		if (result != 0) {
			if (isOnGoingBid) { // 입찰중
				this.compareHigherPrice(bid);
			} else {
				// 주문 진행(오더 호출)
				// 구매 성사 - 구매자, 판매자
				// 판매 상태 변경
				// 판매 최저가 변경 알람

			}
		}

		return result;
	}

	private int insertNewBid(Connection con, BidDTO bid) throws SQLException {

		PreparedStatement ps = null;
		String sql = "insert into BID values(BID_NO_SEQ.NEXTVAL, ?, ?, ?, ?, CURRENT_DATE)";
		int result = 0;

		try {

			int goodsNo = bid.getGoodsNo(); // 상품번호
			String userId = bid.getUserId(); // 회원아이디
			int bidPrice = bid.getBidPrice(); // 입찰 가격
			String bidStatus = bid.getBidStatus(); // 입찰 상태

			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			ps.setString(2, userId);
			ps.setInt(3, bidPrice);
			ps.setString(4, bidStatus);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;

	}

	public BidDTO getHighestBidPrice(int goodsNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT BID_NO, USER_ID, MAX(BID_PRICE) FROM BID GROUP BY USER_ID, GOODS_NO, BID_STATUS HAVING GOODS_NO = ? AND BID_STATUS='입찰중'";
		BidDTO lowestBid = null;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			rs = ps.executeQuery();

			if (rs.next())
				lowestBid = new BidDTO(rs.getInt(1), goodsNo, rs.getString(2), rs.getInt(3), null, null); // 입찰 번호 넘기기

		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return lowestBid;
	}

	/* 입찰 최고가 비교 */
	private boolean compareHigherPrice(BidDTO bid) throws SQLException {
		boolean result = false;
		BidDTO highest = this.getHighestBidPrice(bid.getGoodsNo());
		if (highest.getBidPrice() < bid.getBidPrice()) {
			// 알림 발송 (알림 내용 정하기)
			// 화면에 입찰 최고가 바꾸기
			result = true;
		}
		return result;
	}

	/* 최근 거래 내역 유무 판단 */
	private boolean isNewBid(Connection con, String userId, int goodsNo) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from BID where USER_ID=? and GOODS_NO=?";
		boolean result = false;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setInt(2, goodsNo);
			rs = ps.executeQuery();

			result = rs.next();

		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
		return result;
	}

	@Override
	public int updateBid(Connection con, BidDTO bid) throws SQLException {
		PreparedStatement ps = null;
		int result = 0;
		String sql = "update bid set BID_PRICE=?, BID_STATUS=? where USER_ID=? and GOODS_NO=?";

		try {

			int goodsNo = bid.getGoodsNo(); // 상품번호
			String userId = bid.getUserId(); // 회원아이디
			int bidPrice = bid.getBidPrice(); // 입찰 가격
			String bidStatus = bid.getBidStatus(); // 입찰 상태

			ps = con.prepareStatement(sql);
			ps.setInt(1, bidPrice);
			ps.setString(2, bidStatus);
			ps.setString(3, userId);
			ps.setInt(4, goodsNo);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);

		}
		return result;
	}

	@Override
	public int deleteBid(int goodsNo, String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "delete from bid where GOODS_NO=? and USER_ID=?";

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			ps.setString(2, userId);
			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}
		return result;
	}

}
