package com.br.web.board.model.vo;

public class Reply {
	
	private int replyNo;
	private String replyWriter;	// 등록시 회원번호 | 조회시 회원아이디 
	private String replyContent;
	private int refBoardNo;
	private String registDt; // 조회시 to_char함수 사용해서 문자열로 조회
	private String status;
	
	public Reply() {}

	public Reply(int replyNo, String replyWriter, String replyContent, int refBoardNo, String registDt, String status) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.refBoardNo = refBoardNo;
		this.registDt = registDt;
		this.status = status;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public String getRegistDt() {
		return registDt;
	}

	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", replyContent=" + replyContent
				+ ", refBoardNo=" + refBoardNo + ", registDt=" + registDt + ", status=" + status + "]";
	}
	
}
