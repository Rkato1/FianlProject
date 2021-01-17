package com.kh.camp.model.vo;

import com.kh.member.model.vo.MemberVO;

import lombok.Data;

@Data
public class SiteVO { //예약장소
	private int siteNo; //site_no 사이트번호
	private int campNo; //camp_no 캠핑장번호
	private String siteTitle;//site_title 사이트제목
	private String siteName;//site_name 사이트이름
	private int minCnt;//min_cnt  최소인원
	private int maxCnt; //max_cnt 최대인원
	private int minNight;//min_night 최소박수
	private int maxNight;//max_night 최대박수
	private int discountPay;//discount_pay 연박할인금액
	private int addCntPay;//add_cnt_pay 추가인원금액
	private int addCarPay;//add_car_pay 추가차량금액
	private int usingCnt;//using_cnt 이용자수
	private int usingPay;//using_pay 이용금액
	private int usingNight;//using_night 이용박수
	private int addCarDay;//add_car_day 추가차량일수
	private int addCarCnt;//add_car_cnt 추가차량대수
	private int memberNo;//member_no 회원번호
	private int reservePay;//reserve_pay 예약금액
	private String reserveDate;//reserve_date 예약일시
	private int lowDayPay;//low_day_pay 비수기평일금액
	private int lowEndPay;//low_end_pay 비수기주말금액
	private int peakDayPay;//peak_day_pay 성수기평일금액
	private int peakEndPay;//peak_end_pay 성수기주말금액
	private int polarDayPay;//polar_day_pay 극성수기평일금액
	private int polarEndPay;//polar_end_pay 극성수기주말금액

}
