package com.kh.notice.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class NoticePageData {
	ArrayList<Notice> list;
	String pageNavi;
	public NoticePageData(ArrayList<Notice> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
}
