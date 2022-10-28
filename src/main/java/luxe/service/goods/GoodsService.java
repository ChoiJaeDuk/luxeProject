package luxe.service.goods;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.GoodsDTO;
import luxe.dto.GoodsImagesDTO;

public interface GoodsService {

	/**
	 * 상품 등록
	 */
	void insertGoods(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException;

	/**
	 * 전체 상품목록 조회
	 */
	List<GoodsDTO> selectAllGoods(String brand, String category, String arrange, String userId) throws SQLException;

	/**
	 * 상품 상세 조회
	 */
	
	GoodsDTO selectGoodsLine(int goodsNo, boolean flag)throws SQLException;
	
	/**
	 * 상품명으로 상품 검색
	 */

	List<GoodsDTO> selectGoodsByGoodsName(String goodsName) throws SQLException;

	/**
	 * 상품 수정
	 */
	void updateGoodsDTO(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException;

	/**
	 * 상품 삭제
	 */
	void deleteGoodsDTO(int goodsNo) throws SQLException;

}
