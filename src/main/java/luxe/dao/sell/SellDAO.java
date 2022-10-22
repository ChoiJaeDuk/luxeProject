package luxe.dao.sell;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.sell.SellDTO;

public interface SellDAO {
	
	/**
	 * 판매 신청등록
	 * @return
	 * @throws SQLException
	 */
	int insertSell(SellDTO sell) throws SQLException;
	
	
	/**
	 * 판매상품 가격수정
	 * @param sellNo
	 * @return
	 * @throws SQLException
	 */
	int updateSellPrice(int sellNo, int updateSellPrice) throws SQLException;
	
	
	/**
	 * 관리자 판매신청 승인단계 
	 * @return
	 * @throws SQLException
	 */
	int updateSellStatus(int sellNo, String sellStatus) throws SQLException;
	
	
	/**
	 * 판매중 상품명, 브랜드명, 진행상태, 거래가, 판매승인일
	 * @return
	 * @throws SQLException
	 */
	List<SellDTO> selectSellingInfoByUserId(String userId) throws SQLException;
		
	
	/**
	 * 판매대기중 상품명 ,브랜드명, 진행상태, 거래가, 판매신청일
	 * @param userId
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
	
	
	/**
	 * 값 매칭
	 * @return
	 * @throws SQLException
	 */
	boolean priceCompare(int 입찰최고가, int goodsNo) throws SQLException;
	
}
