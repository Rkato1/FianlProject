package com.kh.admin.model.vo;

import java.util.ArrayList;

import com.kh.camp.model.vo.CampVO;

import lombok.Data;

@Data
public class CampVOPageData {
	private ArrayList<CampVO> list;
	private ArrayList<Integer> oriNum;
	private String pageNavi;
	public CampVOPageData(ArrayList<CampVO> list, ArrayList<Integer> oriNum, String pageNavi) {
		super();
		this.list = list;
		this.oriNum = oriNum;
		this.pageNavi = pageNavi;
	}
}
