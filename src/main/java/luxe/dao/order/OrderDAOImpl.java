package luxe.dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dao.alarm.AlarmDAO;
import luxe.dao.alarm.AlarmDAOImpl;
import luxe.dao.goodsImages.GoodsImagesDAO;
import luxe.dao.goodsImages.GoodsImagesDAOImpl;
import luxe.dto.AlarmDTO;
import luxe.dto.GoodsDTO;
import luxe.dto.OrderDTO;
import luxe.dto.SellDTO;
import luxe.util.DbUtil;

public class OrderDAOImpl implements OrderDAO {
	GoodsImagesDAO dao = new GoodsImagesDAOImpl();

	/***
	 * 주문등록
	 * 
	 * @param con
	 * @param orderDTO
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int insertOrder(Connection con, OrderDTO orderDTO) throws SQLException {

		PreparedStatement ps = null;

		AlarmDAO dao = new AlarmDAOImpl();

		String sql = "insert into orders values(order_no_seq.nextval,?,?,?,current_date,'검수대기',?,?)";
		int result = 0;

		try {

			ps = con.prepareStatement(sql);

			ps.setInt(1, orderDTO.getSellNo());
			ps.setInt(2, orderDTO.getBidNo());
			ps.setInt(3, orderDTO.getOrderPrice());
			ps.setString(4, orderDTO.getBuyerId());
			ps.setString(5, orderDTO.getSellerId());

			result = ps.executeUpdate();
			if (result == 1) {
				GoodsDTO goods = selectGoodsNo(con, orderDTO.getSellNo());
				AlarmDTO alarm = new AlarmDTO(0, goods.getGoodsNo(), "주문성사", goods.getGoodsName() + "상품의 주문이 성사되었습니다.", null);
				dao.insertAlarm(alarm);

			}
		
		}finally {
			DbUtil.dbClose(null, ps);
		}

		return result;

	}
	
	/***
	 * 거래에 해당하는 상품 정보 불러오기
	 * @param con
	 * @param sellNo
	 * @return
	 * @throws SQLException
	 */
	private GoodsDTO selectGoodsNo(Connection con, int sellNo) throws SQLException {

		PreparedStatement ps = null;
		ResultSet rs = null;
		GoodsDTO goods = null;

		String sql = "select * \r\n" + "from goods join sell\r\n" + "on goods.goods_no = sell.goods_no\r\n"
				+ "where sell_no=?";

		try {

			ps = con.prepareStatement(sql);

			ps.setInt(1, sellNo);

			rs = ps.executeQuery();

			if (rs.next()) {
				goods = new GoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getInt(10));
			}


		} finally {
			DbUtil.dbClose(null, ps, rs);

		}

		return goods;
	}

	/***
	 * 주문내역조회
	 */
	@Override
	public List<OrderDTO> selectOrder() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select order_no, order_price, to_char(order_date, 'YY-MM-DD'), order_status, buyer_id, seller_id from orders order by order_date desc";
		List<OrderDTO> list = new ArrayList<OrderDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new OrderDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6)));
			}
			

		} finally {
			DbUtil.dbClose(con, ps, rs);

		}

		return list;

	}

	/***
	 * 회원별 주문내역 조회(구매내역)
	 * 
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<OrderDTO> selectOrderByUserIdForBuy(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		

		String sql = "select goods.goods_no, goods_name, brand, order_status, order_price, to_char(order_date, 'YY-MM-DD')\r\n"
				+ "from orders join bid \r\n"
				+ "on orders.bid_no = bid.bid_no join goods \r\n"
				+ "on goods.goods_no = bid.goods_no\r\n"
				+ "where buyer_id = ?\r\n"
				+ "order by order_date desc";
		List<OrderDTO> list = new ArrayList<OrderDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, userId);

			rs = ps.executeQuery();
			

			while (rs.next()) {
				String goodsMainImg = dao.selectMainImgByGoodsNo(rs.getInt(1));
				list.add(new OrderDTO(goodsMainImg, rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);

		}

		return list;
	}

	/***
	 * 주문내역조회(판매내역)
	 */
	@Override
	public List<OrderDTO> selectOrderByUserIdForSell(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select goods.goods_no, goods_name, brand, order_status, order_price, to_char(order_date, 'YY-MM-DD') \r\n" + "from orders \r\n"
				+ "join sell on orders.sell_no = sell.sell_no\r\n" + "join goods on goods.goods_no = sell.goods_no\r\n"
				+ "where seller_id = ? order by order_date desc";
		List<OrderDTO> list = new ArrayList<OrderDTO>();

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, userId);

			rs = ps.executeQuery();

			while (rs.next()) {
				String goodsMainImg = dao.selectMainImgByGoodsNo(rs.getInt(1));
				list.add(
						new OrderDTO(goodsMainImg, rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
			}

		} finally {
			DbUtil.dbClose(con, ps, rs);

		}

		return list;
	}

	/***
	 * 주문상태 변경
	 */
	@Override
	public int updateOrderByOrderNo(String orderNo, String orderStatus) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		String sql = "update orders set order_status = ? where order_no = ?";
		int result = 0;

		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, orderStatus);
			ps.setString(2, orderNo);

			result = ps.executeUpdate();

		} finally {
			DbUtil.dbClose(con, ps);
		}

		return result;

	}

}
