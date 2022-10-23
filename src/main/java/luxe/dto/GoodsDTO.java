package luxe.dto;

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

	private String goodsMainImg;//재덕추가
	public GoodsDTO() {
		super();
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
	
	public GoodsDTO(String brand,  String goodsName, String goodsNameKor, String category,  String goodsMainImg) {
		super();
		this.brand = brand;
		this.category = category;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
		this.goodsMainImg = goodsMainImg;
	}

	public GoodsDTO(String goodsName, String brand) {//재덕추가
		super();
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
}
