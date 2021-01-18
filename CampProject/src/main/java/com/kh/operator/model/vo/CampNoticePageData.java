package com.kh.operator.model.vo;

import java.util.ArrayList;

public class CampNoticePageData {
	private ArrayList<CampNoticeVO> list;
	private String pageNavi;
	public CampNoticePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CampNoticePageData(ArrayList<CampNoticeVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<CampNoticeVO> getList() {
		return list;
	}
	public void setList(ArrayList<CampNoticeVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
