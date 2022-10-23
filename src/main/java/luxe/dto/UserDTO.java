package luxe.dto;

public class UserDTO {

	private String userId;
	private String userPwd;
	private String userName;
	private String userAddr;
	private String userDetailAddr;
	private String userPhone;
	private String job;

	public UserDTO() {
	}

	public UserDTO(String userId, String userPwd, String userName, String userAddr, String userDetailAddr,
			String userPhone, String job) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userAddr = userAddr;
		this.userDetailAddr = userDetailAddr;
		this.userPhone = userPhone;
		this.job = job;
	}

	public UserDTO(String userId, String UserPwd) {
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserDetailAddr() {
		return userDetailAddr;
	}

	public void setUserDetailAddr(String userDetailAddr) {
		this.userDetailAddr = userDetailAddr;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

}
