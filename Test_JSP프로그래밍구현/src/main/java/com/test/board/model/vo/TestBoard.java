package com.test.board.model.vo;

public class TestBoard {
	
	private int boardNo;
	private String category;
	private String boardTitle;
	private String boardContent;
	private String fileOriginName;
	private String fileURL;
	private int count;
	private String createDate;
	private String status;
	
	public TestBoard() {}

	public TestBoard(int boardNo, String category, String boardTitle, String boardContent, String fileOriginName,
			String fileURL, int count, String createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.category = category;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.fileOriginName = fileOriginName;
		this.fileURL = fileURL;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public TestBoard(int boardNo, String category, String boardTitle, int count, String createDate) {
		super();
		this.boardNo = boardNo;
		this.category = category;
		this.boardTitle = boardTitle;
		this.count = count;
		this.createDate = createDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getFileOriginName() {
		return fileOriginName;
	}

	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}

	public String getFileURL() {
		return fileURL;
	}

	public void setFileURL(String fileURL) {
		this.fileURL = fileURL;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TestBoard [boardNo=" + boardNo + ", category=" + category + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", fileOriginName=" + fileOriginName + ", fileURL=" + fileURL
				+ ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	

}
