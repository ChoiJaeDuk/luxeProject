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
	public List<GoodsDTO> selectAllGoods(String brand, String category, String sort, String userId, String search) throws SQLException {

		if (brand==null || brand.equals("")) {
			brand = "'%'";
		}
		if (category==null || category.equals("")) {
			category = "'%'";
		}
		if (sort==null || category.equals("")) {
			sort = "";
		}
		if (search==null || search.equals("")){
			search="'%'";
		}
		List<GoodsDTO> list = goodsDAO.selectAllGoods(brand, category, sort,userId,search);

		return list;
	}

	@Override
	public GoodsDTO selectGoodsLine(int goodsNo, boolean flag) throws SQLException {
		
		GoodsDTO goodsDTO = goodsDAO.selectGoodsLine(goodsNo);
		if (goodsDTO == null) {
			throw new SQLException("");
		}
		return goodsDTO;
	}

	@Override
	public List<GoodsDTO> selectGoodsByGoodsName(String goodsName) throws SQLException {
		
		List<GoodsDTO> list = goodsDAO.selectGoodsByGoodsName(goodsName);
		
		return list;
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
