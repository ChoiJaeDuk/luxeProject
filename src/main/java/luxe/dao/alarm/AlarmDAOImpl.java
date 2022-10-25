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


public class AlarmDAOImpl implements AlarmDAO {
	
	/***
	 * 알람등록
	 * @param con
	 * @param alarm 
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int insertAlarm(AlarmDTO alarm) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "insert into alarm values(alarm_no_seq.nextval,?,?, current_date, ?)";
		int result=0;
		
		try {
		   con= DbUtil.getConnection();	
		   ps = con.prepareStatement(sql);
		   
		   ps.setInt(1, alarm.getGoodsNo());
		   ps.setString(2, alarm.getAlarmContent());
		   ps.setString(3, alarm.getAlarmSubject());
		  
		   result = ps.executeUpdate();
		   if(result == 1) selectUserId(con, alarm.getGoodsNo());
		   
		}finally{
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}
	
	/***
	 * 상품에 해당하는 거래 중인 회원 찾기
	 * @param con
	 * @param goodsNo
	 */
	private void selectUserId(Connection con, int goodsNo) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select user_id \r\n"
				+ "from bid\r\n"
				+ "where goods_no = ? and bid_status='입찰중'\r\n"
				+ "union \r\n"
				+ "select user_id\r\n"
				+ "from sell\r\n"
				+ "where goods_no=? and sell_status='판매중'";
		
		List<String> userIdList = new ArrayList<String>();
		
		try {
		 
		   ps = con.prepareStatement(sql);
		   
		   ps.setInt(1, goodsNo);
		   ps.setInt(2, goodsNo);
		   
		   rs = ps.executeQuery();
		  
		   while(rs.next()) {
			   userIdList.add(rs.getString(1));
			   
		   }
		   
		   if(userIdList != null)
			   insertAlarmReceiveUser(con, userIdList);
		   
		}finally{
			DbUtil.dbClose(null, ps, rs);
		}
	
	}
	
	/***
	 * 알림 수신자 알림함에 등록
	 * @param con
	 * @param userId
	 * @throws SQLException
	 */
	private void insertAlarmReceiveUser(Connection con, List<String> userIdList) throws SQLException{
		PreparedStatement ps = null;
		
		String sql = "insert into alarm_receive_user values (alarm_receive_no_seq.nextval, alarm_no_seq.currval, ?, '안읽음')";
		
		try {
		 
		   con.setAutoCommit(false);
		   
		   ps = con.prepareStatement(sql);
		   
		   for(String userId: userIdList) {
			   ps.setString(1, userId);
			   ps.addBatch();// 일괄처리작업을 하기 위한 문장 추가
			   ps.clearParameters();// 들어가는 정보를 전송
		   }
		   //한번에 DBMS에 전송
		   int result [] = ps.executeBatch(); //리턴값은 각 문장의 성공여부가 저장 
		   System.out.println("result.length = " + result.length);
		 
		   boolean state = false; //true이면 취소, false이면 저장완료
		   for(int i : result) {
			   System.out.println(i);
			   if(i==0) {
				   state = true;
				   break;
			   }
		   }
		   
		   if(state) con.rollback();
		   else con.commit();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}

	}
	
	/***
	 * 아이디에 해당하는 알람 조회
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
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
			
			if(alarm != null)
				updateAlarmStatus(con, userId);
		   
		}finally{
			DbUtil.dbClose(con, ps, rs);
		}
		
		return alarm;
	}
	
	/***
	 * 새로운 알람이 있는지 확인
	 */
	@Override
	public List<AlarmReceiveUserDTO> checkNewAlarm(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<AlarmReceiveUserDTO> alarmReceive = new ArrayList<AlarmReceiveUserDTO>();

		String sql = "select * from alarm_receive_user where user_id = ? and alarm_status='안읽음'";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				alarmReceive.add(new AlarmReceiveUserDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
			
		}finally{
			DbUtil.dbClose(con, ps, rs);
		}
		
		return alarmReceive;
	}
	
	/***
	 * 알림 읽음 상태 변경
	 * @param con
	 * @param userId
	 * @throws SQLException
	 */
	private void updateAlarmStatus(Connection con, String userId) throws SQLException {
		
		PreparedStatement ps = null;
		
		String sql = "update alarm_receive_user set alarm_status = '읽음' where user_id = ? and alarm_status = '안읽음'";
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			ps.executeUpdate();
		   
		}finally{
			DbUtil.dbClose(null, ps);
		}
	
	}

	/***
	 * 알람삭제
	 * @param userId
	 * @param alarmNo
	 * @return
	 * @throws SQLException
	 */
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
			
		}finally{
			DbUtil.dbClose(con, ps);
		}
		
		return result;
	}

}
