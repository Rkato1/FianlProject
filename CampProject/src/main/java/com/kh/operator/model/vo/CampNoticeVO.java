package com.kh.operator.model.vo;

public class CampNoticeVO {
	private int campNoticeNo;
	private int campNo;
	private String campNoticeTitle;
	private String campNoticeWriter;
	private String campNoticeContent;
	private String campNoticeDate;
	public CampNoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CampNoticeVO(int campNoticeNo, int campNo, String campNoticeTitle, String campNoticeWriter,
			String campNoticeContent, String campNoticeDate) {
		super();
		this.campNoticeNo = campNoticeNo;
		this.campNo = campNo;
		this.campNoticeTitle = campNoticeTitle;
		this.campNoticeWriter = campNoticeWriter;
		this.campNoticeContent = campNoticeContent;
		this.campNoticeDate = campNoticeDate;
	}
	public int getCampNoticeNo() {
		return campNoticeNo;
	}
	public void setCampNoticeNo(int campNoticeNo) {
		this.campNoticeNo = campNoticeNo;
	}
	public int getCampNo() {
		return campNo;
	}
	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}
	public String getCampNoticeTitle() {
		return campNoticeTitle;
	}
	public void setCampNoticeTitle(String campNoticeTitle) {
		this.campNoticeTitle = campNoticeTitle;
	}
	public String getCampNoticeWriter() {
		return campNoticeWriter;
	}
	public void setCampNoticeWriter(String campNoticeWriter) {
		this.campNoticeWriter = campNoticeWriter;
	}
	public String getCampNoticeContent() {
		return campNoticeContent;
	}
	public void setCampNoticeContent(String campNoticeContent) {
		this.campNoticeContent = campNoticeContent;
	}
	public String getCampNoticeDate() {
		return campNoticeDate;
	}
	public void setCampNoticeDate(String campNoticeDate) {
		this.campNoticeDate = campNoticeDate;
	}
	
	
}
