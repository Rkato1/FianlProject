package com.kh.review.model.vo;

import java.util.ArrayList;

public class ReviewPageData {
	
	private ArrayList<ReviewCampVO> list;
	private String pageNavi;
	
	public ReviewPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewPageData(ArrayList<ReviewCampVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<ReviewCampVO> getList() {
		return list;
	}

	public void setList(ArrayList<ReviewCampVO> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
