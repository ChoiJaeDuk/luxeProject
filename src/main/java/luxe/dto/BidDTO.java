package luxe.dto;

public class BidDTO {

	int bidNo;
	int goodsNo;
	String userId;
	int bidPrice;
	String bidStatus;
	String bidRegDate;

	public BidDTO() {
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

}
