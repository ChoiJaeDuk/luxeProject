package luxe.dao.alarm;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import luxe.dto.AlarmDTO;
import luxe.dto.AlarmReceiveUserDTO;

public interface AlarmDAO {

	/***
	 * 알람 등록
	 * @param alarm
	 * @return
	 * @throws SQLException
	 */
	int insertAlarm(AlarmDTO alarm) throws SQLException;
	
	/***
	 * 알람 조회
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	List<AlarmDTO> selectAlarm(String userId) throws SQLException;
	
	/***
	 * 새로운 알람이 있는지 확인 
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	int countNewAlarm(String userId) throws SQLException;
	/***
	 * 알림 조회 상태 변경 
	 * @param alarmNo
	 * @return
	 * @throws SQLException
	 */
	//int updateAlarmStatus(String userId) throws SQLException;
	
	/***
	 * 알람 삭제
	 * @param alarmNo
	 * @return
	 * @throws SQLException
	 */
	int deleteAlarm(String userId, int alarmNo) throws SQLException;
}
