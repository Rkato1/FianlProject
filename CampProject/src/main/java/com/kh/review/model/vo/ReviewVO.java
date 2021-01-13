package com.kh.review.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int reviewNo;
	private String memberId;
	private int reserveNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewDate;
	private int reviewPoint;
	private int campNo;
	private ArrayList<ReviewFileVO> fileList;
	
	//getter 추가
	public String getReviewContentBr() {
		return reviewContent.replace("\r\n", "<br>");
	}

}
