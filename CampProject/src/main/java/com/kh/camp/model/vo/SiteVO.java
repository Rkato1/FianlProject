package com.kh.camp.model.vo;

import lombok.Data;

@Data
public class SiteVO {
	private int siteNo;
	private int campNo;
	private String siteTitle;
	private String siteName;
	private int usingPay;
	private int minCnt;
	private int maxCnt;
	private int discount;
	private int addCount;
	private int addPark;
	private int usingNight;
	private int usingCnt;
	private int addParkDay;
	private int addParkCnt;
	private int reserveSum;
	private int memberNo;
	private String reserveDate;	
}
