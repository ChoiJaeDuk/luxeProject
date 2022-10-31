package luxe.dto;

public class GoodsImagesDTO {

	private int goodsNO;
	private String GoodsMainImg;
	private String GoodsImg1;
	private String GoodsImg2;
	private String GoodsImg3;
	private String GoodsImg4;

	public GoodsImagesDTO() {
	}

	public GoodsImagesDTO(String goodsMainImg, String goodsImg1, String goodsImg2) {
		super();
		this.GoodsMainImg = goodsMainImg;
		this.GoodsImg1 = goodsImg1;
		this.GoodsImg2 = goodsImg2;
	
	}

	public GoodsImagesDTO(int goodsNO, String goodsMainImg, String goodsImg1, String goodsImg2, String goodsImg3,
			String goodsImg4) {
		super();
		this.goodsNO = goodsNO;
		this.GoodsMainImg = goodsMainImg;
		this.GoodsImg1 = goodsImg1;
		this.GoodsImg2 = goodsImg2;
		this.GoodsImg3 = goodsImg3;
		this.GoodsImg4 = goodsImg4;
	}

	public String getGoodsImg4() {
		return GoodsImg4;
	}

	public void setGoodsImg4(String goodsImg4) {
		GoodsImg4 = goodsImg4;
	}

	public int getGoodsNO() {
		return goodsNO;
	}

	public void setGoodsNO(int goodsNO) {
		this.goodsNO = goodsNO;
	}

	public String getGoodsMainImg() {
		return GoodsMainImg;
	}

	public void setGoodsMainImg(String goodsMainImg) {
		GoodsMainImg = goodsMainImg;
	}

	public String getGoodsImg1() {
		return GoodsImg1;
	}

	public void setGoodsImg1(String goodsImg1) {
		GoodsImg1 = goodsImg1;
	}

	public String getGoodsImg2() {
		return GoodsImg2;
	}

	public void setGoodsImg2(String goodsImg2) {
		GoodsImg2 = goodsImg2;
	}

	public String getGoodsImg3() {
		return GoodsImg3;
	}

	public void setGoodsImg3(String goodsImg3) {
		GoodsImg3 = goodsImg3;
	}
}
