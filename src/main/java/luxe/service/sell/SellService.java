package luxe.service.sell;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.sell.SellDTO;

public interface SellService {
	
	/**
	 * 판매 신청등록
	 * @return
	 * @throws SQLException
	 */
	void insertSell(SellDTO sell) throws SQLException;
	
	
	/**
	 * 판매상품 가격수정
	 * @param sellNo
	 * @return
	 * @throws SQLException
	 */
	void updateSellPrice(int sellNo, int updateSellPrice) throws SQLException;
	
	
	/**
	 * 관리자 판매신청 승인단계 
	 * @return
	 * @throws SQLException
	 */
	void updateSellStatus(int sellNo, String sellStatus) throws SQLException;
	
	
	/**
	 * 상품명, 브랜드명, 진행상태, 거래가, 거래일자
	 * @return
	 * @throws SQLException
	 */
	List<SellDTO> selectSellingInfoByUserId(String userId) throws SQLException;
		
	
	/**
	 * 상품명, 브랜드명, 진행상태, 거래가, 거래일자
	 * @return
	 * @throws SQLException
	 */
	List<SellDTO> selectSellWaitInfoByUserId(String userId) throws SQLException;
	
	
	/**
	 * 최저 판매가격 조회
	 * @return
	 * @throws SQLException
	 */
	SellDTO selectMaxPriceByGoodsNo(int goodsNo) throws SQLException;
	
}
