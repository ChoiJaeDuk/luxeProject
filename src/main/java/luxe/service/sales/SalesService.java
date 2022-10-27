package luxe.service.sales;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.OrderDTO;

public interface SalesService {
	
	/***
	 * 전체 매출 조회
	 * @return
	 * @throws SQLException
	 */
	OrderDTO selectSale() throws SQLException;
	
	/***
	 * 월별 매출 조회
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectSalesByMonth() throws SQLException;
	
	/***
	 * 브랜드별 매출
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectBrandSales() throws SQLException;
	
	/***
	 * 브랜드별 월별 매출 조회
	 * @param brand
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectBrandSalesByMonth(String brand) throws SQLException;
	
	/***
	 * 브랜드별 판매량 조회
	 * @param brand
	 * @return
	 * @throws SQLException
	 */
	List<OrderDTO> selectSalesRateByBrand() throws SQLException;
}
