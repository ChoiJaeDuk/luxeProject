package luxe.dao.sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.OrderDTO;
import luxe.util.DbUtil;

public class SalesDAOImpl implements SalesDAO {
	
	/***
	 * 매출조회
	 */
	@Override
	public OrderDTO selectSales() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		OrderDTO order = null;
		
		String sql = "select nvl(sum(order_price),0) as total_sales, nvl(sum(nvl(order_price,0)*0.03),0) as total_profit from orders";
		
		try {
			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs  = ps.executeQuery();
			
			if(rs.next()){
				order = (new OrderDTO(rs.getInt(1), rs.getInt(2)));
			}
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
			
		}
		
		return order;
	}
	
	/***
	 * 월별 매출 
	 */
	@Override
	public List<OrderDTO> selectSalesByMonth() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		String sql = "select to_char(order_date,'MM') as month, nvl(sum(order_price),0) as total_sales, nvl(sum(nvl(order_price,0)*0.03),0) as total_profit\r\n"
				+ "from orders\r\n"
				+ "group by to_char(order_date,'MM')\r\n"
				+ "order by month asc";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql); 
			
			rs  = ps.executeQuery();
			
			while(rs.next()){
				list.add(new OrderDTO(rs.getString(1), rs.getInt(2), rs.getInt(3)));
			}
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
			
		}
		
		return list;
	}
	
	/***
	 * 브랜드별 월별 매출
	 */
	@Override
	public List<OrderDTO> selectBrandSalesByMonth(String brand) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		String sql = "select to_char(order_date,'MM') as month, nvl(sum(order_price),0) as total_sales, nvl(sum(nvl(order_price,0)*0.03),0) as total_profit\r\n"
				+ "from orders join sell\r\n"
				+ "on orders.sell_no = sell.sell_no join goods\r\n"
				+ "on goods.goods_no = sell.goods_no\r\n"
				+ "group by to_char(order_date,'MM'), goods.brand\r\n"
				+ "having goods.brand = ?\r\n"
				+ "order by month asc";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql); 
			
			ps.setString(1, brand);
			
			rs  = ps.executeQuery();
			
			while(rs.next()){
				list.add(new OrderDTO(rs.getString(1), rs.getInt(2)));
			}
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
			
		}
		
		return list;
	}
	
	/***
	 * 브랜드별 판매량
	 */
	@Override
	public List<OrderDTO> selectSalesRateByBrand(String brand) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		String sql = "select count(order_no) as total_sales_rate, brand\r\n"
				+ "from orders join sell\r\n"
				+ "on orders.sell_no = sell.sell_no right outer join goods\r\n"
				+ "on goods.goods_no = sell.goods_no\r\n"
				+ "group by brand\r\n"
				+ "order by total_sales_rate desc";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql); 
			
			ps.setString(1, brand);
			
			rs  = ps.executeQuery();

			while(rs.next()){
				list.add(new OrderDTO(rs.getInt(1), rs.getString(2)));
			}
			
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
			
		}
		
		return list;
	}

}
