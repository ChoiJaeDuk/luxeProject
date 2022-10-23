package luxe.service.order;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.order.OrderDAO;
import luxe.dao.order.OrderDAOImpl;
import luxe.dto.OrderDTO;

public class OrderServiceImpl implements OrderService {
	OrderDAO dao = new OrderDAOImpl();

	/*@Override
	public void insertOrder(OrderDTO order) throws SQLException {
		
		int result = dao.insertOrder(order);
		
		if(result==0) throw new SQLException("주문을 등록하지 못했습니다.");
		
	}*/

	@Override
	public List<OrderDTO> selectOrder() throws SQLException {
		
		List<OrderDTO> order = dao.selectOrder();
		
		return order;
	}

	@Override
	public List<OrderDTO> selectOrderByUserIdForBuy(String userId) throws SQLException {
		
		List<OrderDTO> order = dao.selectOrderByUserIdForBuy(userId);

		return order;
	}

	@Override
	public List<OrderDTO> selectOrderByUserIdForSell(String userId) throws SQLException {
		
		List<OrderDTO> order = dao.selectOrderByUserIdForSell(userId);

		return order;
	}
	
	@Override
	public void updateOrderByOrderNo(String orderNo, String orderStatus) throws SQLException {
		
		int result = dao.updateOrderByOrderNo(orderNo, orderStatus);
		
		if(result == 0) throw new SQLException("주문상태를 변경하지 못했습니다.");
		
	}

}
