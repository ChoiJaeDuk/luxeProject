package luxe.service.goodsImages;

import java.sql.Connection;
import java.sql.SQLException;

import luxe.dto.GoodsImagesDTO;

public interface GoodsImagesService {

	/**
	 * 상품 이미지 등록
	 */

	void insertImages(Connection con, GoodsImagesDTO goodsImgs) throws SQLException;

	/**
	 * 상품 이미지 수정
	 */

	void updateImages(Connection con, GoodsImagesDTO goodsImgs) throws SQLException;

	/**
	 * 상품 이미지 삭제
	 */

	void deleteGoodsNoImgs(Connection con, int goodsNo) throws SQLException;

}
