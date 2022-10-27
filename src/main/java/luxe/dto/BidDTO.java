package luxe.dto;

public class BidDTO {

	int bidNo;
	int goodsNo;
	String userId;
	int bidPrice;
	String bidStatus;
	String bidRegDate;

	// 입찰 내역 조회
	String goodsName;
	String brand;

	public BidDTO() {
	}

	public BidDTO(int bidNo, int goodsNo, String goodsName, String brand, int bidPrice, String bidRegDate) {
		this.bidNo = bidNo;
		this.goodsNo = goodsNo;
		this.bidPrice = bidPrice;
		this.bidRegDate = bidRegDate;
		this.goodsName = goodsName;
		this.brand = brand;
	}

	public BidDTO(int bidNo, int goodsNo, String userId, int bidPrice, String bidStatus, String bidRegDate) {
		super();
		this.bidNo = bidNo;
		this.goodsNo = goodsNo;
		this.userId = userId;
		this.bidPrice = bidPrice;
		this.bidStatus = bidStatus;
		this.bidRegDate = bidRegDate;

	}

	public int getBidNo() {
		return bidNo;
	}

	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
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

	public int getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getBidStatus() {
		return bidStatus;
	}

	public void setBidStatus(String bidStatus) {
		this.bidStatus = bidStatus;
	}

	public String getBidRegDate() {
		return bidRegDate;
	}

	public void setBidRegDate(String bidRegDate) {
		this.bidRegDate = bidRegDate;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	
	

}
