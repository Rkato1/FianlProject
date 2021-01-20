package com.kh.admin.model.vo;

import java.util.ArrayList;

import com.kh.reserve.model.vo.ReserveVO;

import lombok.Data;
@Data
public class ReserveVOPageData {
	ArrayList<ReserveVO> list;
	String pageNavi;
	public ReserveVOPageData(ArrayList<ReserveVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
