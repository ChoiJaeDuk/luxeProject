package luxe.service.goodsImages;

import java.sql.Connection;
import java.sql.SQLException;

import luxe.dao.goodsImages.GoodsImagesDAO;
import luxe.dao.goodsImages.GoodsImagesDAOImpl;
import luxe.dto.GoodsImagesDTO;

public class GoodsImagesServiceImpl implements GoodsImagesService {

	private GoodsImagesDAO goodImgesDAO = new GoodsImagesDAOImpl();

	@Override
	public void insertImages(Connection con, GoodsImagesDTO goodsImgs) throws SQLException {
		int result = goodImgesDAO.insertImages(con, goodsImgs);
		if(result ==0) {
			throw new SQLException();
		}
	}

	@Override
	public void updateImages(String updateImg, int goodsNo) throws SQLException {
		int result = goodImgesDAO.updateImages(updateImg, goodsNo);
		if(result ==0) {
			throw new SQLException();
		}
		
	}

	@Override
	public void deleteGoodsNoImgs(Connection con, int goodsNo) throws SQLException {
		int result = goodImgesDAO.deleteGoodsNoImgs(con, goodsNo);
		if(result ==0) {
			throw new SQLException();
		}
	}	

}
