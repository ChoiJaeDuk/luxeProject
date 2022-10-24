package luxe.dao.bid;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import luxe.dto.BidDTO;

public interface BidDAO {

	/**
	 * 관리자 - 전체 입찰 조회
	 * 
	 * @return
	 * @throws SQLException
	 */
	List<BidDTO> selectAllBid() throws SQLException;

	/**
	 * 회원 - 전체 입찰 조회
	 * 
	 * @param 회원아이디
	 * @return List<BidDTO>
	 * @throws SQLException
	 */
	List<BidDTO> selectAllBidByUserId(String userId) throws SQLException;

	/**
	 * 회원 - 입찰 상태별 조회
	 * 
	 * @param userId
	 * @param bidState
	 * @return
	 * @throws SQLException
	 */
	List<BidDTO> selectAllBidByUserId(String userId, String bidState) throws SQLException;

	/**
	 * 입찰 내역 중복 확인
	 * 
	 * @param bid객체
	 * @return
	 * @throws SQLException
	 */
	boolean checkDuplicatedBid(BidDTO bid) throws SQLException;

	/**
	 * 입찰 등록
	 * 
	 * @param 입찰 정보
	 * @return : 1이면 등록 성공, 0이면 등록 실패
	 * @throws SQLException
	 */
	int insertBid(BidDTO bid) throws SQLException;

	/**
	 * 상품 번호 해당 입찰 최고가 조회
	 * 
	 * @param Connection
	 * @param 상품번호
	 * @return
	 * @throws SQLException
	 */
	BidDTO getHighestBidPrice(int goodsNo) throws SQLException;

	/**
	 * 입찰 가격 수정
	 * 
	 * @param 회원아이디, 상품번호, 수정 가격
	 * @return : 1이면 수정 성공, 0이면 수정 실패
	 * @throws SQLException
	 */
	int updateBidPrice(BidDTO bid) throws SQLException;

	/**입찰 상태 수정
	 * 
	 * @param 입찰 번호
	 * @return : 1이면 수정 성공, 0이면 수정 실패
	 * @throws SQLException
	 */
	int updateBidStatus(int bidNo) throws SQLException;

	/**
	 * 입찰 삭제
	 * 
	 * @param 상품번호
	 * @param 회원아이디
	 * @return : 1이면 삭제 성공, 0이면 삭제 실패
	 * @throws SQLException
	 */
	int deleteBid(int goodsNo, String userId) throws SQLException;

}
