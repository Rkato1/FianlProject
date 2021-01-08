package com.kh.camp.camp.model.vo;

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
	private int campFeeOriDay; //평상시이용요금(주중)
	private int campFeeOriEnd;//평상시이용요금(주말)
	private int campFeePeakDay;//성수기이용요금(주중)
	private int campFeePeakEnd;//성수기이용요금(주말)
	private ArrayList<CampPictureVo> pictureList; //캠프 사진 리스트
}
