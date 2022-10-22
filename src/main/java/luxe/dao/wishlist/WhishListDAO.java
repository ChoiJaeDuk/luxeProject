package luxe.dao.wishlist;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.WishListDTO;

public interface WhishListDAO {
	
	/**
	 * 관심목록 등록
	 * @return
	 * @throws SQLException
	 */
	int insertWishList(WishListDTO wishListDTO) throws SQLException;
	
	
	int deleteWishList(int wishListNo) throws SQLException;
	
	
	List<WishListDTO> selectWishList(String userId) throws SQLException;
	
}
