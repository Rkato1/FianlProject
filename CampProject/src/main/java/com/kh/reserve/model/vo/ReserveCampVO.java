package com.kh.reserve.model.vo;

public class ReserveCampVO {
	
	private int reserveNo; //예약번호
	private int memberNo; //회원번호
	private int campNo;	//캠핑장번호
	private String checkInDate; //입실일
	private String checkOutDate; //퇴실일
	private String reserveStatus; //예약상태
	private String reservePlace; //예약장소
	private int reservePrice; //결제금액
	private String reservePw; //예약비밀번호
	private String carNumber; //차량번호
	private String reserveMeno; //예약메모
	private String campName;
	
	public ReserveCampVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReserveCampVO(int reserveNo, int memberNo, int campNo, String checkInDate, String checkOutDate,
			String reserveStatus, String reservePlace, int reservePrice, String reservePw, String carNumber,
			String reserveMeno, String campName) {
		super();
		this.reserveNo = reserveNo;
		this.memberNo = memberNo;
		this.campNo = campNo;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reserveStatus = reserveStatus;
		this.reservePlace = reservePlace;
		this.reservePrice = reservePrice;
		this.reservePw = reservePw;
		this.carNumber = carNumber;
		this.reserveMeno = reserveMeno;
		this.campName = campName;
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getReserveStatus() {
		return reserveStatus;
	}

	public void setReserveStatus(String reserveStatus) {
		this.reserveStatus = reserveStatus;
	}

	public String getReservePlace() {
		return reservePlace;
	}

	public void setReservePlace(String reservePlace) {
		this.reservePlace = reservePlace;
	}

	public int getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}

	public String getReservePw() {
		return reservePw;
	}

	public void setReservePw(String reservePw) {
		this.reservePw = reservePw;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	public String getReserveMeno() {
		return reserveMeno;
	}

	public void setReserveMeno(String reserveMeno) {
		this.reserveMeno = reserveMeno;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}
	
}
