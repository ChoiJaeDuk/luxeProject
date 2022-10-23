package luxe.service.sales;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.OrderDTO;

public interface SalesService {
	
	OrderDTO selectSale() throws SQLException;
	
	List<OrderDTO> selectSalesByMonth() throws SQLException;
	
	List<OrderDTO> selectBrandSalesByMonth(String brand) throws SQLException;
	
	OrderDTO selectSalesRateByBrand(String brand) throws SQLException;
}
