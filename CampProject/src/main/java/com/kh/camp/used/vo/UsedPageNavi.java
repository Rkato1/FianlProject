package com.kh.camp.used.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UsedPageNavi {
	private ArrayList<UsedVO> list;
	private String pageNavi;
}
