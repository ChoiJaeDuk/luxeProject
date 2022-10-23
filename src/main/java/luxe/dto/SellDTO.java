package luxe.dto;

public class SellDTO {
	private int sellNo;
	private int goodsNo;
	private String userId;
	private String accountNo;
	private String sellStatus;
	private int sellPrice;
	private String sellDate;
	private String purdate;
	private String serialNumber;
	
	
	private String goodsName;

	
	public SellDTO() {}

	
	public SellDTO( int goodsNo, String userId, String accountNo, int sellPrice, String purdate, String serialNumber) {
		this.goodsNo = goodsNo;
		this.userId = userId;
		this.accountNo = accountNo;
		this.sellPrice = sellPrice;
		this.purdate = purdate;
		this.serialNumber = serialNumber;
	}
	
	
	public SellDTO(int goodsNo, String userId, int sellPrice) {
		super();
		this.goodsNo = goodsNo;
		this.userId = userId;
		this.sellPrice = sellPrice;
	}

	public SellDTO(int sellPrice, String sellDate , GoodsDTO goodsDTO) {
		this.sellPrice = sellPrice;
		this.sellDate = sellDate;
	}
	
	
	

	public SellDTO(int sellNo, String userId, String goodsName, int sellPrice, String purdate,String serialNumber, String sellDate ,String sellStatus) {
		super();
		this.sellNo = sellNo;
		this.userId = userId;
		this.sellStatus = sellStatus;
		this.sellPrice = sellPrice;
		this.sellDate = sellDate;
		this.purdate = purdate;
		this.serialNumber = serialNumber;
		this.goodsName = goodsName;
	}


	public int getSellNo() {
		return sellNo;
	}

	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}

	public int getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getPurdate() {
		return purdate;
	}

	public void setPurdate(String purdate) {
		this.purdate = purdate;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerial_number(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	
	
}