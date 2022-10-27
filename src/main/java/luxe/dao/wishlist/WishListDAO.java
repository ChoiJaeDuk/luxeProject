package luxe.dao.wishlist;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.GoodsDTO;
import luxe.dto.WishListDTO;

public interface WishListDAO {
	
	/**
	 * 관심목록 등록
	 * @return
	 * @throws SQLException
	 */
	int insertWishList(WishListDTO wishListDTO) throws SQLException;
	
	
	int deleteWishList(int goodsNo) throws SQLException;
	
	
	List<GoodsDTO> selectWishList(String userId) throws SQLException;
	
}
