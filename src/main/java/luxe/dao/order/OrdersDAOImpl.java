package luxe.dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.SellDTO;
import luxe.dto.order.OrderDTO;
import luxe.util.DbUtil;

public class OrdersDAOImpl implements OrderDAO {
	@Override
	public int insertOrder(OrderDTO orderDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result=0;
		
		try {
		   con = DbUtil.getConnection();
		   ps = con.prepareStatement("insert into orders values(order_no_seq.nextval,?,?,?,current_date,'검수대기',?,?)");
		   
//		   ps.setInt(1, order.getOrderNo());
//		   ps.setInt(2, order.getSellNo());
//		   ps.setInt(3, order.getBidNo());
//		   ps.setInt(4, order.getOrderPrice());
//		   ps.setString(5, order.getOrderDate());
//		   ps.setString(6, order.getOrderStatus());
//		   ps.setString(7, order.getOrderDate());
//		   ps.setString(8, order.getOrderStatus());
		   
		   result = ps.executeUpdate();
		   
		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}
		
		return result;

	}

	@Override
	public List<OrderDTO> selectOrder() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select order_no, order_price, order_date, order_status, seller_id, buyer_id, from orders order by order_date desc");
			rs  = ps.executeQuery();
			
			while(rs.next()){
				list.add(new OrderDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), 
						rs.getString(4), rs.getString(5), rs.getString(6)));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
			
		}
		
		return list;
		 
	}

	/***
	 * 회원별 주문내역 조회(구매내역)
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<OrderDTO> selectOrderByUserIdForBuy(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select goods_name, brand, order_status, order_price, order_date \r\n"
					+ "from orders \r\n"
					+ "join bid on orders.bid_no = bid.bid_no\r\n"
					+ "join goods on goods.goods_no = bid.goods_no\r\n"
					+ "where buyer_id = ? order by order_date desc"); 
			
			ps.setString(1, userId);
			
			rs  = ps.executeQuery();
			
			while(rs.next()){
				list.add(new OrderDTO(rs.getString(1), rs.getString(2), rs.getString(3), 
						rs.getInt(4), rs.getString(5)));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
			
		}
		
		return list;
	}
	
	@Override
	public List<OrderDTO> selectOrderByUserIdForSell(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement("select goods_name, brand, order_status, order_price, order_date \r\n"
					+ "from orders \r\n"
					+ "join sell on orders.sell_no = sell.sell_no\r\n"
					+ "join goods on goods.goods_no = sell.goods_no\r\n"
					+ "where seller_id = ? order by order_date desc");
			
			ps.setString(1, userId);
			
			rs  = ps.executeQuery();
			
			while(rs.next()){
				list.add(new OrderDTO(rs.getString(1), rs.getString(2), rs.getString(3), 
						rs.getInt(4), rs.getString(5)));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
			
		}
		
		return list;
	}
	

	@Override
	public int updateOrderByOrderNo(String orderNo, String orderStatus) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int result=0;
		
		try {
		   con = DbUtil.getConnection();
		   ps = con.prepareStatement("update orders set order_status = ? where order_no = ?");
		   
		   ps.setString(1, orderStatus);
		   ps.setString(2, orderNo);
		   
		   result = ps.executeUpdate();
		   
		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(con, ps);
		}
		
		return result;
		
	}

}
