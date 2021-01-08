package com.kh.camp.camp.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class CampPageData {
	private ArrayList<CampVO> list;
	private String pageNavi;
}
