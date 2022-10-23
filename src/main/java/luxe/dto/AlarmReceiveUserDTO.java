package luxe.dto;

public class AlarmReceiveUserDTO {
	private int alarmReceiveNo;
	private int alarmNo;
	private String userId;
	private String alarmStatus;
	
	public AlarmReceiveUserDTO() {}
	
	

	public AlarmReceiveUserDTO(String userId) {
		super();
		this.userId = userId;
	}

	public AlarmReceiveUserDTO(int alarmReceiveNo, int alarmNo, String userId, String alarmStatus) {
		super();
		this.alarmReceiveNo = alarmReceiveNo;
		this.alarmNo = alarmNo;
		this.userId = userId;
		this.alarmStatus = alarmStatus;
	}

	public int getAlarmReceiveNo() {
		return alarmReceiveNo;
	}

	public void setAlarmReceiveNo(int alarmReceiveNo) {
		this.alarmReceiveNo = alarmReceiveNo;
	}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAlarmStatus() {
		return alarmStatus;
	}

	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
	}
	
	
}
