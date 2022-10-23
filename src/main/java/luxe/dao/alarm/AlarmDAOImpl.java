package luxe.dao.alarm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import luxe.dto.AlarmDTO;
import luxe.dto.AlarmReceiveUserDTO;
import luxe.util.DbUtil;
import oracle.net.aso.r;

public class AlarmDAOImpl implements AlarmDAO {

	//@Override
	public int insertAlarm(Connection con, AlarmDTO alarm) throws SQLException {
		PreparedStatement ps = null;
		
		String sql = "insert into alarm values(alarm_no_seq.nextval,?,?, current_date, ?)";
		int result=0;
		
		try {
		 
		   ps = con.prepareStatement(sql);
		   
		   ps.setInt(1, alarm.getGoodsNo());
		   ps.setString(2, alarm.getAlarmContent());
		   ps.setString(3, alarm.getAlarmSubject());
		  
		   result = ps.executeUpdate();
		   selectUserId(con, alarm.getGoodsNo());
		   
		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}
		
		return result;
	}
	
	private void selectUserId(Connection con, int goodsNo) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select user_id \r\n"
				+ "from bid\r\n"
				+ "where goods_no = ?\r\n"
				+ "union \r\n"
				+ "select user_id\r\n"
				+ "from sell\r\n"
				+ "where goods_no=?";
		
		//sList<AlarmReceiveUserDTO> list = new ArrayList<AlarmReceiveUserDTO>();
		
		try {
		 
		   ps = con.prepareStatement(sql);
		   
		   ps.setInt(1, goodsNo);
		   ps.setInt(2, goodsNo);
		   
		   rs = ps.executeQuery();
		  
		   while(rs.next()) {
			   String userId = rs.getString(1);
			   //list.add(new AlarmReceiveUserDTO(userId));
			   insertAlarmReceiveUser(con, userId);
			   
		   }
		   
		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}
	
	}
	
	private void insertAlarmReceiveUser(Connection con, String userId) throws SQLException{
		PreparedStatement ps = null;
		
		String sql = "insert into alarm_receive_user values (alarm_receive_no_seq.nextval, alarm_no_seq.currval, ?, '안읽음')";
		
		try {
		 
		   ps = con.prepareStatement(sql);
		   
		   ps.setString(1, userId);
		   
		   ps.executeUpdate();
		   
		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}

	}

	@Override
	public List<AlarmDTO> selectAlarm(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<AlarmDTO> alarm = new ArrayList<AlarmDTO>();

		
		String sql = "select goods_name, alarm_subject, alarm_content, issue_date \r\n"
				+ "from alarm a join\r\n"
				+ "goods g on g.goods_no = a.goods_no join\r\n"
				+ "alarm_receive_user ar on ar.alarm_no = a.alarm_no\r\n"
				+ "where user_id=?\r\n"
				+ "order by issue_date desc";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				alarm.add(new AlarmDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
			updateAlarmStatus(con, userId);
		   
		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}
		
		return alarm;
	}
	
	private void updateAlarmStatus(Connection con, String userId) throws SQLException {
		
		PreparedStatement ps = null;
		
		String sql = "update alarm_receive_user set alarm_status = '읽음' where user_id = ? and alarm_status = '안읽음'";
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			ps.executeUpdate();

		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}
	
	}

	@Override
	public int deleteAlarm(String userId, int alarmNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		String sql = "delete from alarm_receive_user where user_id = ? and alarm_no = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userId);
			ps.setInt(2, alarmNo);
			
			result = ps.executeUpdate();
			
		   
		}catch(SQLException e){
		   e.printStackTrace();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}
		
		return result;
	}

}
