package luxe.service.order;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.OrderDTO;

public interface OrderService {
	
	//void insertOrder(OrderDTO order) throws SQLException;
	
	List<OrderDTO> selectOrder() throws SQLException;
	
	List<OrderDTO> selectOrderByUserIdForBuy(String userId) throws SQLException;
	
	List<OrderDTO> selectOrderByUserIdForSell(String userId) throws SQLException;
	
	void updateOrderByOrderNo(String orderNo, String orderStatus) throws SQLException;
	

}
