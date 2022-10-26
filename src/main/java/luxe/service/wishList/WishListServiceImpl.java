package luxe.service.wishList;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.wishlist.WishListDAO;
import luxe.dao.wishlist.WishListDAOImpl;
import luxe.dto.GoodsDTO;
import luxe.dto.WishListDTO;

public class WishListServiceImpl implements WishListService {
	private WishListDAO wishListDAO = new WishListDAOImpl();
	@Override
	public int insertWishList(WishListDTO wishListDTO) throws SQLException {
		int result = wishListDAO.insertWishList(wishListDTO);
		if (result==0) throw new SQLException("등록실패");
		return result;
	}

	@Override
	public int deleteWishList(int wishListNo) throws SQLException {
		int result = wishListDAO.deleteWishList(wishListNo);
		if (result==0) throw new SQLException("삭제실패");
		return result;
	}

	@Override
	public List<GoodsDTO> selectWishList(String userId) throws SQLException {
		List<GoodsDTO> wishList = wishListDAO.selectWishList(userId);
		
		return wishList;
	}

}
