package luxe.service.alarm;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.AlarmDTO;

public interface AlarmService {
	List<AlarmDTO> selectAlarm(String userId) throws SQLException;
	
	void deleteAlarm(String userId, int alarmNo) throws SQLException;
}
