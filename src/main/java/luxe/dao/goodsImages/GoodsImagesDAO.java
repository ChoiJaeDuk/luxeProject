package luxe.dao.goodsImages;

import java.sql.Connection;
import java.sql.SQLException;

import luxe.dto.GoodsImagesDTO;

public interface GoodsImagesDAO {

	/**
	 * 상품 이미지 등록
	 */

	int insertImages(Connection con, GoodsImagesDTO goodsImgs) throws SQLException;

	/**
	 * 상품 이미지 수정
	 */

	int updateImages(Connection con, GoodsImagesDTO goodsImgs) throws  SQLException;
	
	/**
	 *  상품 이미지 삭제
	 */
	
	int deleteGoodsNoImgs(Connection con, int goodsNo) throws SQLException;

	
	/**
	 * 상품번호를 통해 상품의 메인 이미지 주소를 호출한다.
	 * @param goodsNo
	 * @return
	 * @throws SQLException
	 */
	String selectMainImgByGoodsNo(int goodsNo) throws SQLException;
}
