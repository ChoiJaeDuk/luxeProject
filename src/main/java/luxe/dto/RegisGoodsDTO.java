package luxe.dto;

public class RegisGoodsDTO {

	private String regisGoodsNo;
	private String userId;
	private String regisBrand;
	private String regisName;
	private String regisDate;

	public RegisGoodsDTO() {
	}

	public RegisGoodsDTO(String regisGoodsNo, String userId, String regisBrand, String regisName, String regisDate) {
		super();
		this.regisGoodsNo = regisGoodsNo;
		this.userId = userId;
		this.regisBrand = regisBrand;
		this.regisName = regisName;
		this.regisDate = regisDate;
	}

	public String getRegisGoodsNo() {
		return regisGoodsNo;
	}

	public void setRegisGoodsNo(String regisGoodsNo) {
		this.regisGoodsNo = regisGoodsNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRegisBrand() {
		return regisBrand;
	}

	public void setRegisBrand(String regisBrand) {
		this.regisBrand = regisBrand;
	}

	public String getRegisName() {
		return regisName;
	}

	public void setRegisName(String regisName) {
		this.regisName = regisName;
	}

	public String getRegisDate() {
		return regisDate;
	}

	public void setRegisDate(String regisDate) {
		this.regisDate = regisDate;
	}

}
