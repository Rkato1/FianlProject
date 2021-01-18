package com.kh.reserve.model.vo;

import java.util.ArrayList;

import com.kh.camp.model.vo.SiteVO;
import com.kh.member.model.vo.MemberVO;

import lombok.Data;

@Data
public class ReserveListsVO {
	private ArrayList<SiteVO> siteList;
	private ArrayList<MemberVO> memberList;
	private ArrayList<ReserveVO> reserveList;
	private ArrayList<SiteVO> sitePriceList;

}
