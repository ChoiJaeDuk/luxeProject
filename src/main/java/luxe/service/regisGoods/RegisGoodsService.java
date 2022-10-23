package luxe.service.regisGoods;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.RegisGoodsDTO;

public interface RegisGoodsService {

	/**
	 * 신규상품문의 등록
	 * 
	 * @param regisGoodsDto
	 * @return
	 */
	void insertRegisGoods(RegisGoodsDTO regisGoodsDto) throws SQLException;

	/**
	 * 신규 상품 문의 전체 조회
	 * 
	 * @return
	 */
	List<RegisGoodsDTO> selectAllRegisGoods() throws SQLException;

	/**
	 * 신규 상품 문의 전체 조회, 페이징
	 * 
	 * @return
	 */
	List<RegisGoodsDTO> getBoardList(int pageNo) throws SQLException;

}