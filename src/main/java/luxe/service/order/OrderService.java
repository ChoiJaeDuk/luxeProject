package luxe.service.order;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.OrderDTO;

public interface OrderService {
	
	//void insertOrder(OrderDTO order) throws SQLException;
	
	/***
	 * 주문내역조회(관리자)
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectOrder() throws SQLException;
	
	/***
	 * 주문내역조회(구매)
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectOrderByUserIdForBuy(String userId) throws SQLException;
	
	/***
	 * 주문내역조회(판매)
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectOrderByUserIdForSell(String userId) throws SQLException;
	
	/***
	 * 주문상태 변경
	 * @param orderNo
	 * @param orderStatus
	 * @throws SQLException
	 */
	void updateOrderByOrderNo(String orderNo, String orderStatus) throws SQLException;
	

}
