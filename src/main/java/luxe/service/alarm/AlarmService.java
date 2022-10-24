package luxe.service.alarm;

import java.sql.SQLException;
import java.util.List;

import luxe.dto.AlarmDTO;
import luxe.dto.AlarmReceiveUserDTO;

public interface AlarmService {
	/***
	 * 알람등록
	 * @param alarm
	 * @throws SQLException
	 */
	void insertAlarm(AlarmDTO alarm) throws SQLException;
	
	/***
	 * 알람조회
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	List<AlarmDTO> selectAlarm(String userId) throws SQLException;
	
	/***
	 * 새로운 알람 확인 
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	boolean checkNewAlarm(String userId) throws SQLException;
	
	/***
	 * 알람삭제
	 * @param userId
	 * @param alarmNo
	 * @throws SQLException
	 */
	void deleteAlarm(String userId, int alarmNo) throws SQLException;
}
