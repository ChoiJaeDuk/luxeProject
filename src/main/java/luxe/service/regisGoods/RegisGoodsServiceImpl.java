package luxe.service.regisGoods;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.regisGoods.RegisGoodsDAO;
import luxe.dao.regisGoods.RegisGoodsDAOImpl;
import luxe.dto.RegisGoodsDTO;

public class RegisGoodsServiceImpl implements RegisGoodsService {

	private RegisGoodsDAO regisGoodsDao = new RegisGoodsDAOImpl();

	/**
	 * 상품문의 등록
	 */
	@Override
	public void insertRegisGoods(RegisGoodsDTO regisGoodsDto) throws SQLException {
		int result = regisGoodsDao.insertRegisGoods(regisGoodsDto);
		if (result == 0) {
			throw new SQLException("상품문의등록실패");
		}
	}

	/**
	 * 상품문의 전체 조회
	 */
	@Override
	public List<RegisGoodsDTO> selectAllRegisGoods() throws SQLException {
		List<RegisGoodsDTO> list = regisGoodsDao.selectAllRegisGoods();
	
		return list;
	}

	@Override
	public List<RegisGoodsDTO> getBoardList(int pageNo) throws SQLException {
		return null;
	}

}
