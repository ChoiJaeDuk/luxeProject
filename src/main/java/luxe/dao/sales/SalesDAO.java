package luxe.dao.sales;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.OrderDTO;

public interface SalesDAO {
	
	/***
	 * 전체 매출, 수수료 수익 조회
	 * @return
	 * @throws SQLException
	 */
	OrderDTO selectSales() throws SQLException;
	
	/***
	 * 월별 매출, 수수료 수익 조회
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectSalesByMonth () throws SQLException;
	
	/***
	 * 브랜드별 월매출 조회
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectBrandSalesByMonth(String brand) throws SQLException;
	
	/***
	 * 브랜드별 판매량 조회
	 * @return
	 * @throws SQLException
	 */
	OrderDTO selectSalesRateByBrand(String brand) throws SQLException;
	
	
}
