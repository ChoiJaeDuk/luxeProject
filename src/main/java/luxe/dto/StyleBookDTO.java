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

	public int getreadNo() {
		return readNo;
	}

	public void setreadNo(int readNo) {
		this.readNo = readNo;
	}

	public int getlikeNo() {
		return likeNo;
	}

	public void setlikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

}
