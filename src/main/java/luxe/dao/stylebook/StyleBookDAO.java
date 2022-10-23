package luxe.dao.stylebook;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.StyleBookDTO;

public interface StyleBookDAO {

	/**
	 * 전체 스타일북 게시물 조회
	 * 
	 * @return List<StyleBookDTO>
	 * @throws SQLException
	 */
	List<StyleBookDTO> selectAllStyleBook() throws SQLException;

	/**
	 * 좋아요 수, 최신순으로 게시물 조회
	 * 
	 * @param 조회 정렬 조건
	 * @return List<StyleBookDTO>
	 * @throws SQLException
	 */
	List<StyleBookDTO> selectSortedStyleBook(String sortCondition) throws SQLException;

	/**
	 * 검색조건별 스타일북 조회
	 * 
	 * @param 브랜드명, 상품 번호 등 검색조건
	 * @return List<StyleBookDTO>
	 * @throws SQLException
	 */
	List<StyleBookDTO> selectStyleBookBykeyWord(String keyWord) throws SQLException;

	/**
	 * 스타일북 등록번호에 해당하는 스타일북 조회
	 * 
	 * @param 스타일북 등록 번호
	 * @return StyleBookDTO
	 * @throws SQLException
	 */
	StyleBookDTO selectStyleBookByBoardRegNo(int boardRegNo) throws SQLException;

	/**
	 * 조회수를 증가하는 기능
	 * 
	 * @param 스타일북 등록 번호
	 * @return : 1이면 증가 성공, 0이면 증가 실패
	 * @throws SQLException
	 */
	int increaseStyleBookReadNo(int boardRegNo) throws SQLException;

	/**
	 * 좋아요 수를 증가시키는 기능
	 * 
	 * @param 스타일북 등록 번호
	 * @return : 1이면 증가 성공, 0이면 증가 실패
	 * @throws SQLException
	 */
	int increaseStyleBookLikeNo(int boardRegNo) throws SQLException;

	/**
	 * 스타일북 등록
	 * 
	 * @param styleBook
	 * @return : 1이면 등록 성공, 0이면 실패
	 * @throws SQLException
	 */
	int insertStyleBook(StyleBookDTO styleBook) throws SQLException;

	/**
	 * 스타일북 삭제
	 * 
	 * @param 스타일북 등록 번호
	 * @return : 1이면 삭제 성공, 0이면 삭제 실패
	 * @throws SQLException
	 */
	int deleteStyleBook(int boardRegNo) throws SQLException;

	/**
	 * 스타일북 수정
	 * 주의사항: 수정 내용 정할 것 (현재: 컨텐츠 내용, 이미지파일 수정 가능)
	 * @param 스타일북 등록 번호
	 * @return : 1이면 수정 성공, 0이면 수정 실패
	 * @throws SQLException
	 */
	int updateStyleBook(StyleBookDTO styleBook) throws SQLException;

}
