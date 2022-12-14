package luxe.service.alarm;

import java.sql.SQLException;
import java.util.List;

import luxe.dao.alarm.AlarmDAO;
import luxe.dao.alarm.AlarmDAOImpl;
import luxe.dto.AlarmDTO;
import luxe.dto.AlarmReceiveUserDTO;

public class AlarmServiceImpl implements AlarmService {
	AlarmDAO dao = new AlarmDAOImpl();
	
	@Override
	public void insertAlarm(AlarmDTO alarm) throws SQLException {
		int result = dao.insertAlarm(alarm);
		
		if(result == 0) throw new SQLException("알람을 등록하지 못했습니다");
		
	}
	
	@Override
	public List<AlarmDTO> selectAlarm(String userId) throws SQLException {
		List<AlarmDTO> list = dao.selectAlarm(userId);
		
		return list;
	}
	
	@Override
	public int countNewAlarm(String userId) throws SQLException {
		
		int result = dao.countNewAlarm(userId);
		
		return result;
	}

	@Override
	public int deleteAlarm(String userId, int alarmNo) throws SQLException {
		int result = dao.deleteAlarm(userId, alarmNo);
		
		if(result == 0) throw new SQLException("알람을 삭제하지 못했습니다.");
		
		return result;
	}

}
