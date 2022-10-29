package luxe.service.sell;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.SellDTO;

public interface SellService {
	
	/**
	 * 판매 신청등록
	 * @return
	 * @throws SQLException
	 */
	void insertSell(SellDTO sellDTO) throws SQLException;
	
	
	/**
	 * 판매상품 가격수정
	 * @param sellNo
	 * @return
	 * @throws SQLException
	 */
	void updateSellPrice(SellDTO sellDTO) throws Exception;
	
	
	/**
	 * 관리자 판매신청 승인단계 
	 * @return
	 * @throws SQLException
	 */
	int updateSellStatus(SellDTO sellDTO) throws Exception;
	
	
	/**
	 * 관리자가 모든 판매신청현황을 조회한다.
	 * @return
	 * @throws SQLException
	 */
	List<SellDTO> selectSellAll() throws SQLException;
	
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
	
	
	/**
	 * 시리얼넘버를 통해 상품 중복검사 
	 * @param serialNo
	 * @return 중복이면 true 중복이 아니면 false
	 * @throws SQLException
	 */
	public boolean sellDuplicateCheck(SellDTO sellDTO) throws SQLException;
	
	/**
	 * SellNo를 받아 해당되는 sell을 삭제한다.
	 * @param sellNo
	 * @throws SQLException
	 */
	public void deleteSell(int sellNo) throws SQLException;
	
}
