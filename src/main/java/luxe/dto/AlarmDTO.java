package luxe.dto;

public class AlarmDTO {
	private int alarmNo;
	private int goodsNo;
	private String alarmSubject;
	private String alarmContent;
	private String issueDate;
	private String goodsName;
	
	private int pageCnt;
	
	public AlarmDTO() {}
	
	

	public AlarmDTO(int goodsNo, String alarmSubject, String alarmContent) {
		super();
		this.goodsNo = goodsNo;
		this.alarmSubject = alarmSubject;
		this.alarmContent = alarmContent;
	}



	public AlarmDTO(int alarmNo, String goodsName, String alarmSubject, String alarmContent, String issueDate) {
		super();
		this.alarmNo = alarmNo;
		this.goodsName = goodsName;
		this.alarmSubject = alarmSubject;
		this.alarmContent = alarmContent;
		this.issueDate = issueDate;

	}


	public AlarmDTO(int alarmNo, int goodsNo, String alarmSubject, String alarmContent, String issueDate) {
		super();
		this.alarmNo = alarmNo;
		this.goodsNo = goodsNo;
		this.alarmSubject = alarmSubject;
		this.alarmContent = alarmContent;
		this.issueDate = issueDate;
	}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getAlarmSubject() {
		return alarmSubject;
	}

	public void setAlarmSubject(String alarmSubject) {
		this.alarmSubject = alarmSubject;
	}

	public String getAlarmContent() {
		return alarmContent;
	}

	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}

	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	
	
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}



	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	
	
}
