package com.kh.review.model.vo;

public class ReviewVO {
	
	private int reviewNo;
	private String memberId;
	private int reserveNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewDate;
	private int reviewPoint;
	private int camp_no;
	
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReviewVO(int reviewNo, String memberId, int reserveNo, String reviewTitle, String reviewContent,
			String reviewDate, int reviewPoint, int camp_no) {
		super();
		this.reviewNo = reviewNo;
		this.memberId = memberId;
		this.reserveNo = reserveNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewPoint = reviewPoint;
		this.camp_no = camp_no;
	}
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewPoint() {
		return reviewPoint;
	}
	public void setReviewPoint(int reviewPoint) {
		this.reviewPoint = reviewPoint;
	}
	public int getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(int camp_no) {
		this.camp_no = camp_no;
	}
	
}
