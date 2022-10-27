package luxe.service.sell;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dao.sell.SellDAO;
import luxe.dao.sell.SellDAOImpl;
import luxe.dto.SellDTO;

public class SellServiceImpl implements SellService {
	private SellDAO sellDAO = new SellDAOImpl();
	@Override
	public void insertSell(SellDTO sellDTO) throws SQLException {
		int result = sellDAO.insertSell(sellDTO);
		if (result==0) throw new SQLException("등록실패");
	}

	@Override
	public void updateSellPrice(SellDTO sellDTO) throws SQLException {
		int result = sellDAO.updateSellPrice(sellDTO);
		if (result==0) throw new SQLException("업데이트 실패");
	}

	
	@Override
	public void updateSellStatus(SellDTO sellDTO) throws SQLException {
		int result = sellDAO.updateSellStatus(sellDTO);
		if (result==0) throw new SQLException("판매상태 업데이트 실패");
		
		
	}

	
	@Override
	public List<SellDTO> selectSellAll() throws SQLException {
		List<SellDTO> sellList = sellDAO.selectSellAll();
		return sellList;
	}
	
	
	@Override
	public List<SellDTO> selectSellingInfoByUserId(String userId) throws SQLException {
		List<SellDTO> sellingList = new ArrayList<SellDTO>();
		sellingList = sellDAO.selectSellingInfoByUserId(userId);
		
		return sellingList;
	}
	
	@Override
	public List<SellDTO> selectSellWaitInfoByUserId(String userId) throws SQLException {
		List<SellDTO> sellWaitList = new ArrayList<SellDTO>();
		sellWaitList = sellDAO.selectSellWaitInfoByUserId(userId);
		return sellWaitList;
	}

	@Override
	public SellDTO selectMaxPriceByGoodsNo(int goodsNo) throws SQLException {
		SellDTO sellDTO = sellDAO.selectLowestPriceByGoodsNo(goodsNo);
	
		if(sellDTO==null) {
			throw new SQLException("판매가 없습니다.");
		}
		return sellDTO;
	}
	
	
	public boolean sellDuplicateCheck(SellDTO sellDTO) throws SQLException{
		boolean result = sellDAO.sellDuplicateCheck(sellDTO);
		return result;
	}
	
	
	public void deleteSell(int sellNo) throws SQLException{
		int result = sellDAO.deleteSell(sellNo);
		if(result ==0) {
			throw new SQLException("삭제에 실패했습니다.");
		}
	}

}


