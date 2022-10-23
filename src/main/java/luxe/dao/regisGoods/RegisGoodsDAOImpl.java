package luxe.dao.regisGoods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.RegisGoodsDTO;
import luxe.util.DbUtil;

public class RegisGoodsDAOImpl implements RegisGoodsDAO {

	@Override
	public int insertRegisGoods(RegisGoodsDTO regisGoodsDto) throws SQLException {

		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = "insert into regis_goods values(regis_no_seq.nextval, ?,?,?,CURRENT_DATE)";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, regisGoodsDto.getUserId());
			ps.setString(2, regisGoodsDto.getRegisGoodsBrand());
			ps.setString(3, regisGoodsDto.getRegisGoodsName());
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}

	@Override
	public List<RegisGoodsDTO> selectAllRegisGoods() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<RegisGoodsDTO> list = new ArrayList<RegisGoodsDTO>();

		String sql = "select * from regis_goods oder by regis_goods_date desc";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				RegisGoodsDTO regisGoodDto = new RegisGoodsDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5));

				list.add(regisGoodDto);
			}
		} finally {
			DbUtil.dbClose(con, ps, rs);
		}
		return list;
	}

	@Override
	public List<RegisGoodsDTO> getBoardList(int pageNo) throws SQLException {
		return null;
	}

}
