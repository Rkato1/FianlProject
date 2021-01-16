package com.kh.admin.model.vo;

import java.util.ArrayList;

import com.kh.camp.model.vo.CampVO;

import lombok.Data;

@Data
public class CampVOPageData {
	ArrayList<CampVO> list;
	String pageNavi;
	public CampVOPageData(ArrayList<CampVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
