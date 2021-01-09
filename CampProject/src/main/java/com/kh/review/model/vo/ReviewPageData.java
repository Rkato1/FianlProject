package com.kh.review.model.vo;

import java.util.ArrayList;

public class ReviewPageData {
	
	private ArrayList<ReviewVO> list;
	private String pageNavi;
	
	public ReviewPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReviewPageData(ArrayList<ReviewVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<ReviewVO> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

}
