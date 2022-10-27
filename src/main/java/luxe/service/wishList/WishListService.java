package luxe.service.wishList;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.GoodsDTO;
import luxe.dto.WishListDTO;

public interface WishListService {
	int insertWishList(WishListDTO wishListDTO) throws SQLException;
	
	
	int deleteWishList(int goodsNo) throws SQLException;
	
	
	List<GoodsDTO> selectWishList(String userId) throws SQLException;
	
	
	boolean selectWishState(int goodsNo, String userId) throws SQLException;
}
