package com.kh.camp.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class CampPageData {
	private ArrayList<CampVO> list;
	private String pageNavi;
	
	public CampPageData(ArrayList<CampVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public CampPageData() {
		super();
		// TODO Auto-generated constructor stub
	}	
}
