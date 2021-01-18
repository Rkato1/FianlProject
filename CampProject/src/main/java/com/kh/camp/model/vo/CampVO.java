package com.kh.camp.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class CampVO {
	private int campNo; //캠핑장번호
	private String campName; //캠핑장이름
	private String campAddr; //캠핑장주소
	private int memberNo; //회원번호(사업자번호)
	private String campShow; //캠핑장소개글(상세)
	private String campType; //캠핑장유형
	private String campPh; //문의처
	private String campPeriod;//운영기간
	private String campDay; //운영일
	private String campFacility; //이용가능시설
	private ArrayList<CampPictureVO> pictureList; //캠프 사진 리스트
	private ArrayList<SiteVO> siteList; //캠핑장소 리스트
	private ArrayList<CampPictureVO> layoutList; //캠프 레이아웃리스트
}
