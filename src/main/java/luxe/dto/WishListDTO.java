package luxe.dto;

public class WishListDTO {
	private int wishListNo;
	private String userId;
	private int goodsNo;
	
	
	public WishListDTO(int wishListNo, String userId, int goodsNo) {
		super();
		this.wishListNo = wishListNo;
		this.userId = userId;
		this.goodsNo = goodsNo;
	}


	public int getWishListNo() {
		return wishListNo;
	}


	public void setWishListNo(int wishListNo) {
		this.wishListNo = wishListNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getGoodsNo() {
		return goodsNo;
	}


	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	
}
