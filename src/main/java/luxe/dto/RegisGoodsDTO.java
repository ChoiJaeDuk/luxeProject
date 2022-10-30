package luxe.dto;

public class RegisGoodsDTO {

	private int regisGoodsNo;
	private String userId;
	private String regisGoodsBrand;
	private String regisGoodsName;
	private String regisDate;

	public RegisGoodsDTO() {
	}

	public RegisGoodsDTO(int regisGoodsNo, String userId, String regisGoodsBrand, String regisGoodsName, String regisDate) {
		super();
		this.regisGoodsNo = regisGoodsNo;
		this.userId = userId;
		this.regisGoodsBrand = regisGoodsBrand;
		this.regisGoodsName = regisGoodsName;
		this.regisDate = regisDate;
	}

	public int getRegisGoodsNo() {
		return regisGoodsNo;
	}

	public void setRegisGoodsNo(int regisGoodsNo) {
		this.regisGoodsNo = regisGoodsNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRegisGoodsBrand() {
		return regisGoodsBrand;
	}

	public void setRegisGoodsBrand(String regisGoodsBrand) {
		this.regisGoodsBrand = regisGoodsBrand;
	}

	public String getRegisGoodsName() {
		return regisGoodsName;
	}

	public void setRegisGoodsName(String regisGoodsName) {
		this.regisGoodsName = regisGoodsName;
	}

	public String getRegisDate() {
		return regisDate;
	}

	public void setRegisDate(String regisDate) {
		this.regisDate = regisDate;
	}

}
