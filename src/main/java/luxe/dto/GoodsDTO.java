package luxe.dto;

import java.util.List;

public class GoodsDTO {

	private int goodsNo;
	private String brand;
	private String category;
	private String goodsName;
	private String goodsNameKor;
	private String goodsDate;
	private int goodsReadNo;
	private String goodsModelNo;
	private String goodsReleaseDate;
	private int goodsReleasePrice;

	private String goodsMainImg;// 재덕추가
	private GoodsImagesDTO goodsImagesDTO;
	private String mainImg;
	private int sellPrice;
	private int lowestPrice;
	private int highestPrice;
	
	
	//로그인된 사용자가 좋아요 클릭한 상태인 상품인지 여부를 판다!!!
	private int goodsLikeByUser ;

	public void setGoodsReleaseDate(String goodsReleaseDate) {
		this.goodsReleaseDate = goodsReleaseDate;
	}

	public GoodsDTO() {
		super();
	}
	
	
	
	

	public GoodsDTO(String mainImg, String goodsName, String goodsNameKor, String brand, String category,
			int sellPrice, int goodsNo) {
		this.brand = brand;
		this.category = category;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
		this.mainImg = mainImg;
		this.sellPrice = sellPrice;
		this.goodsNo = goodsNo;
	}
	
	public GoodsDTO(String brand, String category, String goodsName, String goodsNameKor, String goodsModelNo,
			String goodsReleaseDate, int goodsReleasePrice) {
		this.brand = brand;
		this.category = category;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
		this.goodsModelNo = goodsModelNo;
		this.goodsReleaseDate = goodsReleaseDate;
		this.goodsReleasePrice = goodsReleasePrice;
	}

	public GoodsDTO(String brand, String category, String goodsName, String goodsNameKor, String goodsModelNo,
			String goodsReleaseDate, int goodsReleasePrice, int goodsNo) {
		this.brand = brand;
		this.category = category;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
		this.goodsModelNo = goodsModelNo;
		this.goodsReleaseDate = goodsReleaseDate;
		this.goodsReleasePrice = goodsReleasePrice;
		this.goodsNo = goodsNo;
	}

	public GoodsDTO(String brand, String goodsName, String goodsNameKor, String category , String goodsModelNo,
			String goodsReleaseDate, int goodsReleasePrice, int goodsNo, int lowestPrice, int highestPrice, GoodsImagesDTO goodsImagesDTO) {
		super();
		this.brand = brand;
		this.category = category;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
		this.goodsModelNo = goodsModelNo;
		this.goodsReleaseDate = goodsReleaseDate;
		this.goodsReleasePrice = goodsReleasePrice;
		this.goodsImagesDTO = goodsImagesDTO;
		this.goodsNo = goodsNo;
		this.lowestPrice = lowestPrice;
		this.highestPrice = highestPrice;
	
	}

	public GoodsDTO(int goodsNo, String brand, String category, String goodsName, String goodsNameKor, String goodsDate,
			int goodsReadNo, String goodsModelNo, String goosReleaseDate, int goodsReleasePrice) {
		super();
		this.goodsNo = goodsNo;
		this.brand = brand;
		this.category = category;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
		this.goodsDate = goodsDate;
		this.goodsReadNo = goodsReadNo;
		this.goodsModelNo = goodsModelNo;
		this.goodsReleaseDate = goosReleaseDate;
		this.goodsReleasePrice = goodsReleasePrice;
	}
	
	public GoodsDTO(int goodsNo, String brand, String category, String goodsName, String goodsNameKor, String goodsDate,
			int goodsReadNo, String goodsModelNo, String goosReleaseDate, int goodsReleasePrice, String goodsMainImg) {
		this(goodsNo, brand, category, goodsName, goodsNameKor, goodsDate, goodsReadNo, goodsModelNo, goosReleaseDate, goodsReleasePrice);
		this.goodsMainImg = goodsMainImg;
	}

	public GoodsDTO(int lowestPrice ,String brand, String goodsName, String goodsNameKor, String category, String goodsMainImg, int goodsNo) {
		super();
		this.brand = brand;
		this.category = category;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
		this.goodsMainImg = goodsMainImg;
		this.lowestPrice = lowestPrice;
		this.goodsNo = goodsNo;
	}

	public GoodsDTO(String goodsName, String brand, int highestPrice) {// 재덕추가
		super();
		this.highestPrice = highestPrice;
		this.brand = brand;
		this.goodsName = goodsName;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsNameKor() {
		return goodsNameKor;
	}

	public void setGoodsNameKor(String goodsNameKor) {
		this.goodsNameKor = goodsNameKor;
	}

	public String getGoodsDate() {
		return goodsDate;
	}

	public void setGoodsDate(String goodsDate) {
		this.goodsDate = goodsDate;
	}

	public int getGoodsReadNo() {
		return goodsReadNo;
	}

	public void setGoodsReadNo(int goodsReadNo) {
		this.goodsReadNo = goodsReadNo;
	}

	public String getGoodsModelNo() {
		return goodsModelNo;
	}

	public void setGoodsModelNo(String goodsModelNo) {
		this.goodsModelNo = goodsModelNo;
	}

	public String getGoodsReleaseDate() {
		return goodsReleaseDate;
	}

	public void setGoosReleaseDate(String goodsReleaseDate) {
		this.goodsReleaseDate = goodsReleaseDate;
	}

	public int getGoodsReleasePrice() {
		return goodsReleasePrice;
	}

	public void setGoodsReleasePrice(int goodsReleasePrice) {
		this.goodsReleasePrice = goodsReleasePrice;
	}

	public String getGoodsMainImg() {
		return goodsMainImg;
	}

	public void setGoodsMainImg(String goodsMainImg) {
		this.goodsMainImg = goodsMainImg;
	}

	public GoodsImagesDTO getGoodsImagesDTO() {
		return goodsImagesDTO;
	}

	public void setGoodsImagesDTO(GoodsImagesDTO goodsImagesDTO) {
		this.goodsImagesDTO = goodsImagesDTO;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public int getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}

	public int getLowestPrice() {
		return lowestPrice;
	}

	public void setLowestPrice(int lowestPrice) {
		this.lowestPrice = lowestPrice;
	}

	public int getHighestPrice() {
		return highestPrice;
	}

	public void setHighestPrice(int highestPrice) {
		this.highestPrice = highestPrice;
	}

	public int getGoodsLikeByUser() {
		return goodsLikeByUser;
	}

	public void setGoodsLikeByUser(int goodsLikeByUser) {
		this.goodsLikeByUser = goodsLikeByUser;
	}

	
	
	

}
