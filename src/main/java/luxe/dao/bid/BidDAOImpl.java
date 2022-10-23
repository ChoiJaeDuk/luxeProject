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

		boolean isNew = this.isNewBid(con, bid.getUserId(), bid.getGoodsNo());
		int lowestSellPrice = sellDao.selectMaxPriceByGoodsNo(bid.getGoodsNo()).getSellPrice();

		// 입찰 상태 설정
		if (bid.getBidPrice() == lowestSellPrice) {
			bid.setBidStatus("입찰완료");
		} else
			bid.setBidStatus("입찰중");

		if (isNew) {
			result = this.insertNewBid(con, bid);
			if (result != 0) {
				// 주문 메소드 호출
			}
		} else
			result = this.updateBidPrice(con, bid);

		return result;
	}

	private int insertNewBid(Connection con, BidDTO bid) throws SQLException {

		PreparedStatement ps = null;
		String sql = "insert into BID values(BID_NO_SEQ.NEXTVAL, ?, ?, ?, ?, CURRENT_DATE)";
		int result = 0;

		try {
			if (con == null)
				con = DbUtil.getConnection();

			int bidPrice = bid.getBidPrice();
			String userId = bid.getUserId();
			int goodsNo = bid.getGoodsNo();

			BidDTO lowestBid = this.getLowestBidPrice(con, goodsNo);
			if (bidPrice < lowestBid.getBidPrice()) {
				// 알림 발송
				// 화면에 입찰 최고가 바꾸기
			}

			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			ps.setString(2, userId);
			ps.setInt(3, bidPrice);
			ps.setString(4, bid.getBidStatus());

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;

	}

	public BidDTO getLowestBidPrice(Connection con, int goodsNo) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT USER_ID, MAX(BID_PRICE) FROM BID GROUP BY USER_ID, GOODS_NO, BID_STATUS HAVING GOODS_NO = ? AND BID_STATUS='입찰중'";
		BidDTO lowestBid = null;

		try {
			if (con == null)
				con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, goodsNo);
			rs = ps.executeQuery();

			if (rs.next())
				lowestBid = new BidDTO(0, goodsNo, rs.getString(1), rs.getInt(2), null, null);

		} finally {
			DbUtil.dbClose(null, ps, rs);
		}
		return lowestBid;
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
	public int updateBidPrice(Connection con, BidDTO bid) throws SQLException {

		try {
			if (con == null)
				con = DbUtil.getConnection();
		} finally {

		}
		return 0;
	}

	@Override
	public int updateBidState(BidDTO bid) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBid(String userId, int goodsNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
