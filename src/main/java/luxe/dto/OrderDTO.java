package luxe.dto;

public class OrderDTO {
	private int orderNo;
	private int sellNo;
	private int bidNo;
	private int orderPrice;
	private String orderDate;
	private String orderStatus;
	private String sellerId;
	private String buyerId;
	
	private String goodsName;
	private String brand;
	
	private String month;
	
	private int totalSales;
	private int totalSalesByBrand;
	private int totalProfit;
	private int totalSalesRate;
	
	private String GoodsMainImg;
	private int goodsNo;

	public OrderDTO(){}

	
	public OrderDTO(String goodsMainImg, int goodsNo, String goodsName, String brand, String orderStatus, int orderPrice, String orderDate) {
		super();
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.goodsName = goodsName;
		this.brand = brand;
		GoodsMainImg = goodsMainImg;
		this.goodsNo = goodsNo;
	}


	public OrderDTO(int sellNo, int bidNo, int orderPrice, String sellerId, String buyerId) {
		super();
		this.sellNo = sellNo;
		this.bidNo = bidNo;
		this.orderPrice = orderPrice;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
	}

	public OrderDTO(int totalSales, int totalProfit) {
		super();
		this.totalSales = totalSales;
		this.totalProfit = totalProfit;
	}

	

	public OrderDTO(String month, int totalSales, int totalProfit) {
		super();
		this.month = month;
		this.totalSales = totalSales;
		this.totalProfit = totalProfit;
	}
	
	public OrderDTO(String month, int totalSales) {
		super();
		this.month = month;
		this.totalSales = totalSales;
	}
	
	


	public OrderDTO(int totalSalesRate, String brand) {
		super();
		this.totalSalesRate = totalSalesRate;
		this.brand = brand;
	}



	public OrderDTO(String goodsName, String brand, String orderStatus, int orderPrice, String orderDate) {
		super();
		this.goodsName = goodsName;
		this.brand = brand;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
	}

	public OrderDTO(int orderNo, int orderPrice, String orderDate, String orderStatus, String sellerId,
			String buyerId) {
		super();
		this.orderNo = orderNo;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
	}
	
	public OrderDTO(int orderNo, int sellNo, int bidNo, int orderPrice, String orderDate, String orderStatus,
			String sellerId, String buyerId) {
		super();
		this.orderNo = orderNo;
		this.sellNo = sellNo;
		this.bidNo = bidNo;
		this.orderPrice = orderPrice;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
	}


	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getSellNo() {
		return sellNo;
	}

	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}

	public int getBidNo() {
		return bidNo;
	}

	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public String getSellerId() {
		return sellerId;
	}


	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}


	public String getBuyerId() {
		return buyerId;
	}


	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}


	public String getMonth() {
		return month;
	}


	public void setMonth(String month) {
		this.month = month;
	}


	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}


	public int getTotalSales() {
		return totalSales;
	}



	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}


	public int getTotalSalesByBrand() {
		return totalSalesByBrand;
	}


	public void setTotalSalesByBrand(int totalSalesByBrand) {
		this.totalSalesByBrand = totalSalesByBrand;
	}


	public int getTotalProfit() {
		return totalProfit;
	}


	public void setTotalProfit(int totalProfit) {
		this.totalProfit = totalProfit;
	}


	public int getTotalSalesRate() {
		return totalSalesRate;
	}


	public void setTotalSalesRate(int totalSalesRate) {
		this.totalSalesRate = totalSalesRate;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}


	public String getGoodsMainImg() {
		return GoodsMainImg;
	}


	public void setGoodsMainImg(String goodsMainImg) {
		GoodsMainImg = goodsMainImg;
	}


	public int getGoodsNo() {
		return goodsNo;
	}


	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	
	
}
