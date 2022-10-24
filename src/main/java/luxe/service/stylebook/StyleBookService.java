package luxe.service.stylebook;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.StyleBookDTO;

public interface StyleBookService {

	/**
	 * 전체 스타일북 게시물 조회
	 * 
	 * @param 검색조건
	 * @param 정렬조건
	 * @return List<StyleBookDTO>
	 * @throws SQLException
	 */
	List<StyleBookDTO> selectAllStyleBook(String brand, int goodsNo, String sortCondition) throws SQLException;

	/**
	 * 스타일북 등록 번호를 통해 스타일북 상세 페이지 조회
	 * 
	 * @param 스타일북 등록 번호
	 * @param :    boolean flag - 조회수 증가 여부를 판별하는 매개변수임(true이면 조회수증가 / false이면 조회수
	 *             증가 안함)
	 * @return StyleBookDTO
	 * @throws SQLException
	 */
	StyleBookDTO selectStyleBookByBoardRegNo(int boardRegNo, boolean flag) throws SQLException;

	/**
	 * 좋아요 수를 증가시키는 기능
	 * 
	 * @param 스타일북 등록 번호
	 * @throws SQLException
	 */
	void increaseStyleBookLikeNo(int boardRegNo) throws SQLException;

	/**
	 * 스타일북 등록
	 * 
	 * @param styleBook
	 * @throws SQLException
	 */
	void insertStyleBook(StyleBookDTO styleBook) throws SQLException;

	/**
	 * 스타일북 삭제
	 * 
	 * @param 스타일북 등록 번호
	 * @throws SQLException
	 */
	void deleteStyleBook(int boardRegNo, String saveDir) throws SQLException;

	/**
	 * 스타일북 수정 주의사항: 수정 내용 정할 것 (현재: 컨텐츠 내용 수정 가능)
	 * 
	 * @param 스타일북 수정 객체
	 * @throws SQLException
	 */
	void updateStyleBook(StyleBookDTO styleBook) throws SQLException;

}
