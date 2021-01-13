package com.kh.review.model.vo;

public class ReviewCommentVO {
	
	private int reviewCommentNo;
	private int reviewCommentLevel;
	private String reviewCommentWriter;
	private String reviewCommentContent;
	private int reviewNo;
	private int reviewCommentRef;
	private String reviewCommentDate;
	
	public ReviewCommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewCommentVO(int reviewCommentNo, int reviewCommentLevel, String reviewCommentWriter,
			String reviewCommentContent, int reviewNo, int reviewCommentRef, String reviewCommentDate) {
		super();
		this.reviewCommentNo = reviewCommentNo;
		this.reviewCommentLevel = reviewCommentLevel;
		this.reviewCommentWriter = reviewCommentWriter;
		this.reviewCommentContent = reviewCommentContent;
		this.reviewNo = reviewNo;
		this.reviewCommentRef = reviewCommentRef;
		this.reviewCommentDate = reviewCommentDate;
	}

	public int getReviewCommentNo() {
		return reviewCommentNo;
	}

	public void setReviewCommentNo(int reviewCommentNo) {
		this.reviewCommentNo = reviewCommentNo;
	}

	public int getReviewCommentLevel() {
		return reviewCommentLevel;
	}

	public void setReviewCommentLevel(int reviewCommentLevel) {
		this.reviewCommentLevel = reviewCommentLevel;
	}

	public String getReviewCommentWriter() {
		return reviewCommentWriter;
	}

	public void setReviewCommentWriter(String reviewCommentWriter) {
		this.reviewCommentWriter = reviewCommentWriter;
	}

	public String getReviewCommentContent() {
		return reviewCommentContent;
	}

	public void setReviewCommentContent(String reviewCommentContent) {
		this.reviewCommentContent = reviewCommentContent;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewCommentRef() {
		return reviewCommentRef;
	}

	public void setReviewCommentRef(int reviewCommentRef) {
		this.reviewCommentRef = reviewCommentRef;
	}

	public String getReviewCommentDate() {
		return reviewCommentDate;
	}

	public void setReviewCommentDate(String reviewCommentDate) {
		this.reviewCommentDate = reviewCommentDate;
	}

	//getter 추가
	public String getReviewCommentContentBr() {
		return reviewCommentContent.replace("\r\n", "<br>");
	}
}
