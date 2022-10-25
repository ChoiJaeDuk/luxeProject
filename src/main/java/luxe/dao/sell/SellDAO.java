package luxe.dao.sell;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import luxe.dto.BidDTO;
import luxe.dto.SellDTO;

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
	int updateSellPrice(SellDTO sellDTO) throws SQLException;
	
	
	/**
	 * 관리자 판매신청 승인단계 
	 * @return
	 * @throws SQLException
	 */
	int updateSellStatus(SellDTO sellDTO) throws SQLException;
	
	
	/**
	 * 관리자가 판매신청한 모든 유저의 정보를 조회한다.
	 * @return
	 * @throws SQLException
	 */
	List<SellDTO> selectSellAll() throws SQLException;
	
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
	SellDTO selectLowestPriceByGoodsNo(int goodsNo) throws SQLException;
	
	
	/**
	 * sellNo를 이용해 goodsNo를 구한다.
	 * @param sellNo
	 * @return
	 * @throws SQLException
	 */
	
	public boolean sellDuplicateCheck(SellDTO sellDTO) throws SQLException;
	
	
	/**
	 * sellNo의에 해당하는 sellstatus를 판매완료로 변경한다.
	 * @param sellNo
	 * @return
	 * @throws SQLException
	 */
	public int UpdateSellStatusComplete(int sellNo) throws SQLException;
}
