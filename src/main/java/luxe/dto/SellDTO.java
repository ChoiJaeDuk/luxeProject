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
	private GoodsDTO goodsDTO;
	private String brand;
	
	public SellDTO() {}

	public SellDTO(int sellNo, String sellStatus) {
		this.sellNo = sellNo;
		this.sellStatus = sellStatus;
	}
	
	
	public SellDTO(String userId, String serialNumber) {
		this.userId = userId;
		this.serialNumber = serialNumber;
	}




	public SellDTO(int sellNo, int sellPrice, String userId) {
		super();
		this.sellNo = sellNo;
		this.userId = userId;
		this.sellPrice = sellPrice;
	}

	

	public SellDTO(int sellNo, String userId, String sellStatus,int sellPrice) {
		super();
		this.sellNo = sellNo;
		this.userId = userId;
		this.sellStatus = sellStatus;
		this.sellPrice = sellPrice;
	}



	public SellDTO( int goodsNo, String userId, String accountNo, int sellPrice, String purdate, String serialNumber) {
		this.goodsNo = goodsNo;
		this.userId = userId;
		this.accountNo = accountNo;
		this.sellPrice = sellPrice;
		this.purdate = purdate;
		this.serialNumber = serialNumber;
	}
	
	
	public SellDTO(int goodsNo, String userId, int sellPrice, int sellNo) {
		super();
		this.goodsNo = goodsNo;
		this.userId = userId;
		this.sellPrice = sellPrice;
		this.sellNo = sellNo;
	}

	public SellDTO(int sellPrice, String sellDate , int sellNo ,GoodsDTO goodsDTO) {
		this.sellPrice = sellPrice;
		this.sellDate = sellDate;
		this.goodsDTO = goodsDTO;
		this.sellNo = sellNo;
	}
	
	
	

	public SellDTO(int sellNo, String userId, String brand, String goodsName, int sellPrice, String purdate,String serialNumber, String sellDate ,String sellStatus) {
		super();
		this.sellNo = sellNo;
		this.userId = userId;
		this.brand = brand;
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



	public String getSellDate() {
		return sellDate;
	}



	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}



	public String getGoodsName() {
		return goodsName;
	}



	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}



	public GoodsDTO getGoodsDTO() {
		return goodsDTO;
	}



	public void setGoodsDTO(GoodsDTO goodsDTO) {
		this.goodsDTO = goodsDTO;
	}



	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}




	public String getBrand() {
		return brand;
	}




	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	
}
