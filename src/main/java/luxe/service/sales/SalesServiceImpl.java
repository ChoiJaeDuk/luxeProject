package luxe.service.sales;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.sales.SalesDAO;
import luxe.dao.sales.SalesDAOImpl;
import luxe.dto.order.OrderDTO;

public class SalesServiceImpl implements SalesService {
	SalesDAO dao = new SalesDAOImpl();

	@Override
	public OrderDTO selectSale() throws SQLException {
		OrderDTO order = dao.selectSales();
		
		return order;
	}

	@Override
	public List<OrderDTO> selectSalesByMonth() throws SQLException {
		List<OrderDTO> list = dao.selectSalesByMonth();
		return list;
	}

	@Override
	public List<OrderDTO> selectBrandSalesByMonth(String brand) throws SQLException {
		List<OrderDTO> list = dao.selectBrandSalesByMonth(brand);
		
		return list;
	}

	@Override
	public List<OrderDTO> selectSalesRateByBrand(String brand) throws SQLException {
		List<OrderDTO> list = dao.selectSalesRateByBrand(brand);
		
		return list;
	}

}
