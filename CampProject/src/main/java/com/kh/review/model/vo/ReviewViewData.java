package com.kh.review.model.vo;

import java.util.ArrayList;

public class ReviewViewData {
	private ReviewVO r;
	private int cnt;
	private ArrayList<ReviewCommentVO> list;
	
	public ReviewViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReviewViewData(ReviewVO r, int cnt, ArrayList<ReviewCommentVO> list) {
		super();
		this.r = r;
		this.cnt = cnt;
		this.list = list;
	}
	
	public ReviewVO getR() {
		return r;
	}
	public void setR(ReviewVO r) {
		this.r = r;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public ArrayList<ReviewCommentVO> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewCommentVO> list) {
		this.list = list;
	}
	
}
