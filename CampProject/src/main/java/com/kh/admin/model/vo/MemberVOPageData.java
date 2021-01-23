package com.kh.admin.model.vo;

import java.util.ArrayList;

import com.kh.member.model.vo.MemberVO;

import lombok.Data;

@Data
public class MemberVOPageData {
	ArrayList<MemberVO> list;
	ArrayList<Integer> oriNum;
	String pageNavi;
	public MemberVOPageData(ArrayList<MemberVO> list, ArrayList<Integer> oriNum, String pageNavi) {
		super();
		this.list = list;
		this.oriNum = oriNum;
		this.pageNavi = pageNavi;
	}
}
