package luxe.dao.goods;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.GoodsDTO;

public interface GoodsDAO {

	/**
	 * 상품 등록
	 */
	int insert(GoodsDTO goodsDTO) throws SQLException;

	/**
	 * 전체 상품목록 조회
	 */
	List<GoodsDTO> selectAllGoods() throws SQLException;

	/**
	 * 조회수를 증가 시키는 기능
	 */

	int increaseGoodsReadNo(int goodsNo) throws SQLException;

	/**
	 * 전체 상품 목록 브랜드 별 조회
	 */
	List<GoodsDTO> goodsBrand(String brand) throws SQLException;

	/**
	 * 전체 상품목록 카테고리 별 조회
	 */
	List<GoodsDTO> category(String category) throws SQLException;

	/**
	 * 전체 상품 목록 관심상품(많은 순) 별 조회
	 */

	List<GoodsDTO> selectWishlist() throws SQLException;

	/**
	 * 전체 상품 신상품 조회(최신순)
	 */

	List<GoodsDTO> selectGoodsReleaseDate(String goodsReleaseDate) throws SQLException;

	/**
	 * 상품 가격순 조회(높은 순)
	 */

	List<GoodsDTO> selectByGoodsHighPrice(int goodsReleasePrice) throws SQLException;

	/**
	 * 상품 가격순 조회(높은 순)
	 */

	List<GoodsDTO> selectByGoodsRowPrice(int goodsReleasePrice) throws SQLException;

	/**
	 * 상품명으로 상품 검색
	 */

	GoodsDTO selectGoodsByGoodsName(String goodsName) throws SQLException;

	/**
	 * 상품 수정
	 */
	int updateGoodsDTO(GoodsDTO goodsDTO) throws SQLException;

	/**
	 * 상품 삭제
	 */
	int deleteGoodsDTO(int goodsNo) throws SQLException;

}
