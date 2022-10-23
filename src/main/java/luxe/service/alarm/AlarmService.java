package luxe.service.alarm;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.AlarmDTO;

public interface AlarmService {
	/***
	 * 알람조회
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	List<AlarmDTO> selectAlarm(String userId) throws SQLException;
	
	/***
	 * 알람삭제
	 * @param userId
	 * @param alarmNo
	 * @throws SQLException
	 */
	void deleteAlarm(String userId, int alarmNo) throws SQLException;
}
