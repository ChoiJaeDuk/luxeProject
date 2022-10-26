package luxe.service.bid;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.bid.BidDAO;
import luxe.dao.bid.BidDAOImpl;
import luxe.dto.BidDTO;

public class BidServiceImpl implements BidService {
	private BidDAO bidDao = new BidDAOImpl();

	@Override
	public List<BidDTO> selectAllBid() throws SQLException {
		List<BidDTO> list = bidDao.selectAllBid();
		if (list == null)
			throw new SQLException("입찰 내역이 존재하지 않습니다.");
		return list;
	}

	@Override
	public List<BidDTO> selectAllBidByUserId(String userId, String bidState) throws SQLException {
		String bidSql = "";
		if (bidState != null) {
			bidSql = bidState;
		} else
			bidSql = "%";

		List<BidDTO> list = bidDao.selectAllBidByUserId(userId, bidSql);
		if (list == null)
			throw new SQLException("회원정보에 해당하는 입찰 내역이 존재하지 않습니다.");

		return list;
	}

	@Override
	public BidDTO checkDuplicatedBid(BidDTO bid) throws SQLException {
		return bidDao.checkDuplicatedBid(bid);
	}

	@Override
	public void insertBid(BidDTO bid) throws SQLException {
		int result = bidDao.insertBid(bid);
		if (result == 0)
			throw new SQLException("입찰 등록 실패입니다.");
	}

	@Override
	public BidDTO getHighestBidPrice(int goodsNo) throws SQLException {
		return bidDao.getHighestBidPrice(goodsNo);
	}

	@Override
	public void updateBidPrice(BidDTO bid) throws SQLException {
		int result = bidDao.updateBidPrice(bid);
		if (result == 0)
			throw new SQLException("입찰 가격 수정에 실패했습니다.");
	}

	@Override
	public void updateBidStatus(int bidNo) throws SQLException {
		int result = bidDao.updateBidStatus(bidNo);
		if (result == 0)
			throw new SQLException("입찰 상태 수정에 실패했습니다.");
	}

	@Override
	public void deleteBid(int bidNo, String userId) throws SQLException {
		int result = bidDao.deleteBid(bidNo, userId);
		if (result == 0)
			throw new SQLException("입찰 내역 삭제에 실패했습니다.");
	}

}
