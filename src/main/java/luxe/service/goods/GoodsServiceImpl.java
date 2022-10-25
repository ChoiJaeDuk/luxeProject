package luxe.service.goods;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.goods.GoodsDAO;
import luxe.dao.goods.GoodsDAOImpl;
import luxe.dto.GoodsDTO;
import luxe.dto.GoodsImagesDTO;

public class GoodsServiceImpl implements GoodsService {

	private GoodsDAO goodsDAO = new GoodsDAOImpl();

	@Override
	public void insertGoods(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException {
		int result = goodsDAO.insertGoods(goodsDTO, goodImagesDTO);
		if (result == 0) {
			throw new SQLException("상품 등록 오류");
		}
	}

	@Override
	public List<GoodsDTO> selectAllGoods(String brand, String category, String arrange) throws SQLException {

		if (brand == null) {
			brand = "'%'";
		}
		if (category == null) {
			category = "'%'";
		}
		// if (arrange == )
		List<GoodsDTO> list = selectAllGoods(brand, category, arrange);

		return list;
	}

	@Override
	public List<GoodsDTO> selectGoodsLine(int goodsNo, boolean flag) throws SQLException {
		if (flag) {
			if (goodsDAO.increaseGoodsReadNo(goodsNo) == 0) {
				throw new SQLException("조회수 증가 오류");
			}
		}
		List<GoodsDTO> list = goodsDAO.selectGoodsLine(goodsNo);
		if (list == null) {
			throw new SQLException("");
		}
		return list;
	}

	@Override
	public GoodsDTO selectGoodsByGoodsName(String goodsName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateGoodsDTO(GoodsDTO goodsDTO, GoodsImagesDTO goodImagesDTO) throws SQLException {
		int result = goodsDAO.updateGoodsDTO(goodsDTO, goodImagesDTO);
		if (result == 0)
			throw new SQLException("상품 수정 오류");
	}

	@Override
	public void deleteGoodsDTO(int goodsNo) throws SQLException {
		int result = goodsDAO.deleteGoodsDTO(goodsNo);
		if (result == 0) {
			throw new SQLException("상품 삭제 오류");
		}
	}

}
