package luxe.dto;

public class StyleBookDTO {
	int boardRegNo;
	String userId;
	int goodsNo;
	String boardContent;
	String fName;
	String boardRegDate;
	int readNo;
	int likeNo;

	String modelNo;
	String brand;
	String goodsName;
	String goodsNameKor;

	public StyleBookDTO() {

	}

	public StyleBookDTO(int boardRegNo, String userId, int goodsNo, String boardContent, String fName,
			String boardRegDate, int readNo, int likeNo) {
		this.boardRegNo = boardRegNo;
		this.userId = userId;
		this.goodsNo = goodsNo;
		this.boardContent = boardContent;
		this.fName = fName;
		this.boardRegDate = boardRegDate;
		this.readNo = readNo;
		this.likeNo = likeNo;

	}

	public StyleBookDTO(int boardRegNo, String userId, int goodsNo, String boardContent, String fName,
			String boardRegDate, int readNo, int likeNo, String modelNo, String brand, String goodsName,
			String goodsNameKor) {
		this(boardRegNo, userId, goodsNo, boardContent, fName, boardRegDate, readNo, likeNo);
		this.modelNo = modelNo;
		this.brand = brand;
		this.goodsName = goodsName;
		this.goodsNameKor = goodsNameKor;
	}

	public int getBoardRegNo() {
		return boardRegNo;
	}

	public void setBoardRegNo(int boardRegNo) {
		this.boardRegNo = boardRegNo;
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

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getBoardRegDate() {
		return boardRegDate;
	}

	public void setBoardRegDate(String boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	public int getReadNo() {
		return readNo;
	}

	public void setReadNo(int readNo) {
		this.readNo = readNo;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getModelNo() {
		return modelNo;
	}

	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

}
