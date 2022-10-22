package luxe.dao.order;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.SellDTO;
import luxe.dto.order.OrderDTO;

public interface OrderDAO {
	/***
	 * 주문 등록
	 * @return
	 * @throws SQLException
	 */
	int insertOrder(OrderDTO orderDTO) throws SQLException;
	
	/***
	 * 주문내역 조회
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectOrder() throws SQLException;
	
	/***
	 * 회원별 주문내역 조회(구매내역)
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectOrderByUserIdForBuy(String userId) throws SQLException;
	
	/***
	 * 회원별 주문내역 조회(판매내역)
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectOrderByUserIdForSell(String userId) throws SQLException;
	
	/***
	 * 회원별 주문상태 수정
	 * @return
	 * @throws SQLException
	 */
	int updateOrderByOrderNo(String orderNo, String orderStatus) throws SQLException;
	
	

}
