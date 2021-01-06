package com.kh.reserve.model.vo;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserveNo; //예약번호
	private int memberNo; //회원번호
	private int campNo;//캠핑장번호
	private String checkInDate;//입실일
	private String checkOutDate;//퇴실일
	private String reserveStatus;//예약상태
	private String reservePlace;//예약장소
	private int reservePrice; //결제금액
	private String reservePw;//예약비밀번호
	private String carNumber;//차량번호
	private String reserveMeno;//예약메모
}
