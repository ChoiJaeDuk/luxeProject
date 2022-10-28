package luxe.dao.goods;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.GoodsDTO;
import luxe.dto.GoodsImagesDTO;
import luxe.dto.OrderDTO;

public interface GoodsDAO {

	/**
	 * 상품 등록
	 */
	int insertGoods(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException;

	/**
	 * 전체 상품목록 조회
	 */
	List<GoodsDTO> selectAllGoods(String brand, String category, String arrange, String userId) throws SQLException;

	/**
	 * 상품 상세 조회
	 */
	
	GoodsDTO selectGoodsLine(int goodsNo)throws SQLException;
	
	/**
	 * 조회수를 증가 시키는 기능
	 */

	int increaseGoodsReadNo(int goodsNo) throws SQLException;

	/**
	 * 상품명으로 상품 검색
	 */

	List<GoodsDTO> selectGoodsByGoodsName(String goodsName) throws SQLException;

	/**
	 * 상품 수정
	 */
	int updateGoodsDTO(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException;

	/**
	 * 상품 삭제
	 */
	int deleteGoodsDTO(int goodsNo) throws SQLException;

}
