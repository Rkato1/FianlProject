<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 호출 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- ↓ 모달창 호출 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>예약상세보기</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/reserve/reserveWriteFrm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="modal fade" id="myModal"
		style="z-index: 10000; padding: 0; margin: 0; top: 0; background-color: rgba(0, 0, 0, 0.5);">
		<div class="modal-dialog" style="top: 30%;">
			<div class="modal-content modal-dialog-centered">
				<form method="post" action="/searchOneReserve.do">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">예약 확인</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<input type="hidden" id="modalNo" name="reserveNo"> <input
						type="hidden" name="campNo" value="${camp.campNo }"> <input
						type="hidden" name="date" value="${date }">
					<div class="modal-body">
						예약 암호 : <input type="text" id="modalPw" name="reservePw" required>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">확인</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="items">
			<div class="item">
				<h4>이용안내</h4>
				<hr>
				<ul>
					<li>예약 가능 시간 : 현재일에서 60일까지 가능합니다.</li>
					<li>예약 장소는 자리지정 방식 입니다.</li>
					<li>예약시 최대 6박 7일까지 예약 가능하며, 사이트/객실은 최대 2개까지 가능합니다.</li>
					<li>2021년 성수기 기간은 2월 11일 ~ 13일,3월 6일, 3월13일, 3월20일, 3월28일 ~
						31일 입니다.</li>
					<li>2021년 극성수기 기간은 3월 26일 ~ 27일 입니다.</li>
				</ul>
				<table style="width: 100%" cellpadding="0" cellspacing="1">
					<colgroup width></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<colgroup width="9%"></colgroup>
					<tbody>
						<tr class="pdLlnb1 bg b center">
							<td class="ln_l ln_r ln_b ln_t b" height="25">&nbsp;</td>
							<td class="ln_l ln_r ln_b ln_t b" colspan="3">비수기</td>
							<td class="ln_l ln_r ln_b ln_t b" colspan="3">성수기</td>
							<td class="ln_l ln_r ln_b ln_t b" colspan="3">극성수기</td>
						</tr>
						<tr class="pdLlnb1 bg b center">
							<td class="ln_l ln_r ln_b b" height="25">사이트</td>
							<td class="ln_r ln_l ln_b b">평일단가</td>
							<td class="ln_r ln_l ln_b b">주말단가</td>
							<td class="ln_r ln_l ln_b b">연박할인</td>
							<td class="ln_r ln_l ln_b b">평일단가</td>
							<td class="ln_r ln_l ln_b b">주말단가</td>
							<td class="ln_r ln_l ln_b b">연박할인</td>
							<td class="ln_r ln_l ln_b b">평일단가</td>
							<td class="ln_r ln_l ln_b b">주말단가</td>
							<td class="ln_r ln_l ln_b b">연박할인</td>
						</tr>
						<c:set var="sel" value="0" />
						<c:forEach items="${sitePriceList }" var="s">
							<c:choose>
								<c:when test="${sel == 0 }">
									<tr class="list0 col1 ht center">
										<c:set var="sel" value="1" />
								</c:when>
								<c:otherwise>
									<tr class="list1 col1 ht center">
										<c:set var="sel" value="0" />
								</c:otherwise>
							</c:choose>
							<td class="ln_l ln_r ln_b">${s.siteTitle }</td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.lowDayPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.lowEndPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.discountPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.peakDayPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.peakEndPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.discountPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.polarDayPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.polarEndPay }" pattern="#,###" /></td>
							<td class="ln_r ln_b"><fmt:formatNumber
									value="${s.discountPay }" pattern="#,###" /></td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
			</div>
			<div class="item">
				<br><br>
				<h4>예약선택</h4>
				<hr>
				<div class="item">
					<h4>캠핑장 배치도</h4>
					<img src="resources/upload/camp/${camp.pictureList.get(0).filepath }"
						style="width: 100%; height: 400px;">
				</div>
				<div class="item">
				<br>
					<h4>자리선택</h4>
					<c:choose>
						<c:when test="${dateList.size() > 0}">
							예약일자 : <select id="reserveDates">
								<c:forEach items="${dateList }" var="dates">
									<c:choose>
										<c:when test="${dates eq date }">
											<option value="${dates }" selected="selected">${dates }</option>
										</c:when>
										<c:otherwise>
											<option value="${dates }">${dates }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<br>
						</c:when>
						<c:otherwise>
							예약일자 : ${date}
							<br>
						</c:otherwise>
					</c:choose>

					<table width="100%" cellpadding="0" cellspacing="1">
						<colgroup width></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="15%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="13%"></colgroup>
						<tbody>
							<tr>
								<td colspan="10" class="line3" height="1"></td>
							</tr>
							<tr class="pdLlnb1 bg b center">
								<td class="ln_r ln_l ln_b b" height="35">예약장소</td>
								<td class="ln_r ln_b b">기준/최대</td>
								<td class="ln_r ln_b b">이용요금</td>
								<td class="ln_r ln_b b">연박할인</td>
								<td class="ln_r ln_b b">추가인원</td>
								<td class="ln_r ln_b b">예약기간/가능박수</td>
								<td class="ln_r ln_b b">예약 인원</td>
								<td class="ln_r ln_b b">합계</td>
								<td class="ln_r ln_b b">선택/예약자</td>
							</tr>
							<tr>
								<td colspan="10" class="line2"></td>
							</tr>
							<c:set var="mIdx" value="0" />
							<c:set var="rIdx" value="0" />
							<c:set var="sel" value="0" />
							<c:forEach items="${siteList }" var="s">
								<c:choose>
									<c:when test="${sel == 0 }">
										<tr class="list0 col1 ht center">
											<c:set var="sel" value="1" />
									</c:when>
									<c:otherwise>
										<tr class="list1 col1 ht center">
											<c:set var="sel" value="0" />
									</c:otherwise>
								</c:choose>
								<td class="ln_r ln_l ln_b">${s.siteName }</td>
								<td class="ln_r ln_b"><span id="sta_ea[1]"> <input
										type="hidden" name="minCnt" class="minCnt"
										value="${s.minCnt }"> ${s.minCnt }
								</span>명/${s.maxCnt }명&nbsp;</td>

								<td class="ln_r ln_b"><input type="hidden" name="usingPay"
									class="usingPay" value="${s.usingPay }"> <span>
										<fmt:formatNumber value="${s.usingPay }" pattern="#,###" />
								</span>원</td>


								<td class="ln_r ln_b"><span id="dc_price[1]"> <input
										type="hidden" class="discountPay" value="${s.discountPay }">
										<fmt:formatNumber value="${s.discountPay }" pattern="#,###" />
								</span>원</td>
								<td class="ln_r ln_b"><span id="add_price"> <input
										type="hidden" class="addCntPay" value="${s.addCntPay }">
										<fmt:formatNumber value="${s.addCntPay }" pattern="#,###" />
								</span>원</td>
								<td class="ln_r ln_b"><select class="usingNight">
										<c:forEach var="i" begin="${s.minNight }" end="${s.maxNight}">
											<option value="${i }">${i }박${i+1}일</option>
										</c:forEach>
								</select> / ${s.maxNight }박</td>
								<td class="ln_r ln_b"><select name="person[1]"
									class="usingCnt">
										<c:forEach var="i" begin="${s.minCnt }" end="${s.maxCnt}">
											<option value="${i }">${i }명</option>
										</c:forEach>
								</select></td>
								<td class="ln_r ln_b price"><span class="sumTr">0</span>원</td>
								<td class="ln_r ln_b"><c:choose>
										<c:when test="${s.memberNo == 0 }">
											<input type="checkbox" class="siteChkbx" value="1">
											<input type="hidden" class="modalbtn">
										</c:when>
										<c:otherwise>
											<input type="hidden" class="siteChkbx" value="1">
											${memberList[mIdx].memberName }
											<c:set var="mIdx" value="${mIdx+1 }" />
											<button type="button"
												class="modalbtn btn btn-outline-dark btn-sm"
												value="${reserveList[rIdx].reserveNo }" data-toggle="modal"
												data-target="#myModal" style="height: 30px;">확인</button>
											<c:set var="rIdx" value="${rIdx+1 }" />
										</c:otherwise>
									</c:choose></td>
								</tr>

								<input type="hidden" class="listSiteNo" name="listSiteNo"
									value="${s.siteNo}">
								<input type="hidden" class="listCampNo" name="listCampNo"
									value="${s.campNo}">
								<input type="hidden" class="listSiteTitle" name="listSiteTitle"
									value="${s.siteTitle}">
								<input type="hidden" class="listSiteName" name="listSiteName"
									value="${s.siteName}">
								<input type="hidden" class="listMinCnt" name="listMinCnt"
									value="${s.minCnt}">
								<input type="hidden" class="listMaxCnt" name="listMaxCnt"
									value="${s.maxCnt}">
								<input type="hidden" class="listMinNight" name="listMinNight"
									value="${s.minNight}">
								<input type="hidden" class="listMaxNight" name="listMaxNight"
									value="${s.maxNight}">
								<input type="hidden" class="listDiscountPay"
									name="listDiscountPay" value="${s.discountPay}">
								<input type="hidden" class="listAddCntPay" name="listAddCntPay"
									value="${s.addCntPay}">
								<input type="hidden" class="listAddCarPay" name="listAddCarPay"
									value="${s.addCarPay}">
								<input type="hidden" class="listUsingCnt" name="listUsingCnt"
									value="${s.usingCnt}">
								<input type="hidden" class="listUsingPay" name="listUsingPay"
									value="${s.usingPay}">
								<input type="hidden" class="listUsingNight"
									name="listUsingNight" value="${s.usingNight}">
								<input type="hidden" class="listAddCarDay" name="listAddCarDay"
									value="${s.addCarDay}">
								<input type="hidden" class="listAddCarCnt" name="listAddCarCnt"
									value="${s.addCarCnt}">
								<c:choose>
									<c:when test="${sessionScope.m == null}">
										<input type="hidden" class="listMemberNo" name="listMemberNo" value="0">
									</c:when>
									<c:otherwise>
										<input type="hidden" class="listMemberNo" name="listMemberNo"
									value="${sessionScope.m.memberNo}">
									</c:otherwise>
								</c:choose>								
								<input type="hidden" class="listReservePay"
									name="listReservePay" value="${s.reservePay}">
								<input type="hidden" class="listReserveDate"
									name="listReserveDate" value="${s.reserveDate}">
								<input type="hidden" class="listLowDayPay" name="listLowDayPay"
									value="${s.lowDayPay}">
								<input type="hidden" class="listLowEndPay" name="listLowEndPay"
									value="${s.lowEndPay}">
								<input type="hidden" class="listPeakDayPay"
									name="listPeakDayPay" value="${s.peakDayPay}">
								<input type="hidden" class="listPeakEndPay"
									name="listPeakEndPay" value="${s.peakEndPay}">
								<input type="hidden" class="listPolarDayPay"
									name="listPolarDayPay" value="${s.polarDayPay}">
								<input type="hidden" class="listPolarEndPay"
									name="listPolarEndPay" value="${s.polarEndPay}">

							</c:forEach>
						</tbody>
					</table>
					<table width="100%" cellpadding="0" cellspacion="1">
						<colgroup width="30%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="20%"></colgroup>
						<colgroup width="16%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="13%"></colgroup>
						<tbody>
							<tr>
								<td colspan="6" height="25" align="left">▶ <b>추가 주차/방문
										차량</b> &nbsp;&nbsp; <font color="#66A2C8">* 1사이트당 1대 주차
										가능하며 그외에 추가 차량이 있는 경우 선택 바랍니다.</font>
								</td>
							</tr>
							<tr>
								<td colspan="6" class="line3" heigth="1"></td>
							</tr>
							<tr class="pdLlnb1 bg b center">
								<td class="ln_r ln_l ln_b b" height="25"></td>
								<td class="ln_r ln_b b">주차비</td>
								<td class="ln_r ln_b b">기간</td>
								<td class="ln_r ln_b b">차량수</td>
								<td class="ln_r ln_b b">합계</td>
								<td class="ln_r ln_b b">선택</td>
							</tr>
							<tr>
								<td colspan="6" class="line2"></td>
							</tr>
							<tr class="list0 col1 ht center">
								<td class="ln_r ln_l ln_b pdLlnb1 bg b center" height="35">추가
									차량 선택</td>
								<td class="ln_r ln_b"><span id="car_parking_won"> <input
										type="hidden" value="${siteList[0].addCarPay }"
										name="addCarPay" class="addCarPay"> <fmt:formatNumber
											value="${siteList[0].addCarPay }" pattern="#,###" />
								</span>원</td>
								<td class="ln_r ln_b"><select name="car_parking_day"
									class="addCarDay">
										<c:forEach var="i" begin="${siteList[0].minNight }"
											end="${siteList[0].maxNight}">
											<option value="${i }">${i }일</option>
										</c:forEach>

								</select></td>
								<td class="ln_r ln_b"><select name="car_parking_ea"
									class="addCarCnt">
										<option value="1">1대</option>
										<option value="2">2대</option>
										<option value="3">3대</option>
										<option value="4">4대</option>
										<option value="5">5대</option>
								</select></td>
								<td class="ln_r ln_b price"><span id="carSum">0</span>원</td>
								<td class="ln_r ln_b">
									<c:if test="${siteList.size() != reserveList.size() }">
										<input type="checkbox"	name="car_parking_check" value="1" class="carChkbx">
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<table width="100%" cellpadding="0" cellspacion="1">
						<colgroup width="30%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width></colgroup>
						<colgroup width="7%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="13%"></colgroup>
						<tbody>
							<tr height="0">
								<td height="0"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="9" class="line2"></td>
							</tr>
							<tr class="list0 col1 ht center">
								<td class="ln_r ln_l ln_b b bg" colspan="7" height="70"><b>총
										결제 금액</b></td>
								<td class="price"><b><span id="total">0</span>원</b></td>
								<td class="ln_r"></td>
							</tr>
							<tr>
								<td colspan="9" class="line2"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<div class="item">
			<br>
				<h4>예약자 정보</h4>
				<table class="infomation" width="100%">
					<colgroup>
						<col class="col01">
						<col class="col02">
						<col class="col01">
						<col class="col02">
					</colgroup>
					<tbody>
						<tr>
							<td colspan="6" class="line2" style="height: 1px;"></td>
						</tr>
						<tr>
							<td class="section ln_r" height="50" width="100">
								이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
							<td class="ln_r center" width="250">
								<div class="inputDiv">
									<input type="text" id="inputName" class="inputBox readonly"
										required value="${sessionScope.m.memberName }" readonly>
									<span class="inputSpan"><font color="#66A2C8">&nbsp;
											로그인시 자동입력</font></span>
								</div>
							</td>
							<td class="section ln_r" width="100">예약암호</td>
							<td class="center" width="400">
								<div class="inputDiv">
									<input type="text" id="inputPw" class="inputBox" required
										placeholder="직접입력해주세요."> <span class="inputSpan"><font
										color="#66A2C8">&nbsp; 6~18자리 영어 대소문자/숫자 조합</font></span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6" class="line3" style="height: 1px;"></td>
						</tr>
						<tr>
							<td class="section ln_r" height="50">핸드폰번호</td>
							<td class="ln_r center">
								<div class="inputDiv">
									<input type="text" id="inputPhone" class="inputBox readonly"
										value="${sessionScope.m.memberPhone }" required readonly>
									<span class="inputSpan"><font color="#66A2C8">&nbsp;
											로그인시 자동입력</font></span>
								</div>
							</td>
							<td class="section ln_r">차량번호</td>
							<td class="center">
								<div class="inputDiv">
									<input type="text" id="inputCarNumber" class="inputBox"
										placeholder="직접입력해주세요."> <span class="inputSpan"><font
										color="#66A2C8">&nbsp; ※ 예) 01가 1234, 서울 01가 1234</font></span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6" class="line2" style="height: 1px;"></td>
						</tr>
						<tr>
							<td class="section ln_r" height="50">메모/닉네임</td>
							<td colspan="3" class="center">
								<div class="inputDiv">
									<input type="text" id="inputMemo" placeholder="직접입력해주세요.">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6" class="line2" style="height: 1px;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div class="item">
				<h4>준수사항</h4>
				<hr>
				<ul>
					<li>▶ <b>예약 준수 사항</b></li>
					<li>-예약전 예약주수항 및 환불정책를 꼭 필독하시고 예약하시기 바랍니다.</li>
					<li>예약취소는 캠퍼분이 직접 예약달력창 우측 상단 "확인/취소"> 환불요청 하시면 됩니다.</li>
					<li>환불시 제차 동의 받는 것과 같이 7일 이후 월요일(최대15일)에 처리됩니다.</li>
				</ul>
			</div>
			<div class="item">
				<form action="/insertReserve.do" method="post"
					onsubmit="return reserveInsert();">
					<p class="button">
						<input type="hidden" id="siteArr" name="siteArr">
						<c:choose>
							<c:when test="${sessionScope.m != null }">
								<input type="hidden" id="memberNo" name="memberNo"
									value="${sessionScope.m.memberNo }">
							</c:when>
							<c:otherwise>
								<!-- 비회원용 -->
								<input type="hidden" id="memberNo" name="memberNo" value="0"> 
							</c:otherwise>
						</c:choose>
						<input type="hidden" id="memberName" name="memberName"> <input
							type="hidden" id="campNo" name="campNo" value="${camp.campNo }">
						<input type="hidden" id="campName" name="campName"
							value="${camp.campName }"> <input type="hidden"
							id="reservePlace" name="reservePlace" value="${camp.campAddr }">
						<input type="hidden" id="checkInDate" name="checkInDate"
							value="${date }"> <input type="hidden" id="reserveStatus"
							name="reserveStatus" value="결제대기"> <input type="hidden"
							id="reservePrice" name="reservePrice"> <input
							type="hidden" id="reservePw" name="reservePw"> <input
							type="hidden" id="carNumber" name="carNumber"> <input
							type="hidden" id="reserveMemo" name="reserveMemo"> <input
							type="hidden" id="reserveTotal" name="reserveTotal"> <input
							type="hidden" id="date" name="date" value="${date }"> 
							<c:if test="${sessionScope.m.memberGrade == 1 }">
								<input
							id="reserveBtn" type="submit" class="btn btn-outline-dark btn-sm"
							style="width: 90%; height: 28px;" value="예약하기">
							</c:if>						
					</p>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			/* $("#reserveBtn").click(function(){				
				var memberNo = $("memberNo").val();
				if(memberNo>0){
					memberNo = 1;
				}else{
					memberNo = 0;
				}
				if(memberNo == 0){
					msg += " 로그인 ";
					location.href = "/loginFrm.do";
				}
			}); */
			var name = $("#inputName").val();
			$("#memberName").val(name);
			//예약암호 체크
			$("#inputPw").change(
					function() {
						var reg = /^[A-Za-z0-9_-]{6,18}$/;
						if (reg.test($(this).val())) {
							checkReg[0] = true;
							var comment = '&nbsp; 올바르게 입력하셨습니다';
							$(".inputSpan").eq(1).children().first().html(
									comment);
							$(".inputSpan").eq(1).children().first().attr(
									'color', 'green');
							$("#inputPw").css('border', '2px solid green');
						} else {
							checkReg[0] = false;
							var comment = '&nbsp; 6~18자리 영어 대소문자/숫자 조합';
							$(".inputSpan").eq(1).children().first().html(
									comment);
							$(".inputSpan").eq(1).children().first().attr(
									'color', 'red');
							$("#inputPw").css('border', '2px solid red');
						}
					});
			//차량번호 체크
			$("#inputCarNumber")
					.change(
							function() {
								var val = $('#inputCarNumber').val();
								var reg = /^[0-9]{2}[가-힣]{1}[\s]*[0-9]{4}$/;//신 : 11가 1234
								var reg2 = /^[가-힣]{2}[\s]*[0-9]{2}[가-힣]{1}[\s]*[0-9]{4}$/; //구 : 서울 11가 1234
								if (reg.test(val)) {
									checkReg[1] = true;
									var comment = '&nbsp; 올바르게 입력하셨습니다';
									$(".inputSpan").eq(3).children().first()
											.html(comment);
									$(".inputSpan").eq(3).children().first()
											.attr('color', 'green');
									$("#inputCarNumber").css('border',
											'2px solid green');
								} else {
									if (reg2.test(val)) {
										checkReg[1] = true;
										var comment = '&nbsp; 올바르게 입력하셨습니다';
										$(".inputSpan").eq(3).children()
												.first().html(comment);
										$(".inputSpan").eq(3).children()
												.first().attr('color', 'green');
										$("#inputCarNumber").css('border',
												'2px solid green');

									} else {
										checkReg[1] = false;
										var comment = '&nbsp; ※ 예) 01가 1234, 서울 01가 1234';
										$(".inputSpan").eq(3).children()
												.first().html(comment);
										$(".inputSpan").eq(3).children()
												.first().attr('color', 'red');
										$("#inputCarNumber").css('border',
												'2px solid red');
									}
								}
							});
		});
		//확인 버튼 클릭한경우 모달input에 reserveNo가지고오기		
		$(".modalbtn").click(function() {
			var val = $(this).val();
			var reserveNo = val;
			$("#modalNo").val(reserveNo);
		});
		//Keyup이벤트들
		$("#inputName").keyup(function() {
			var val = $(this).val();
			$("#memberName").val(val);
		});
		$("#inputPw").keyup(function() {
			var val = $(this).val();
			$("#reservePw").val(val);
		});
		$("#inputCarNumber").keyup(function() {
			var val = $(this).val();
			$("#carNumber").val(val);
		});
		$("#inputMemo").keyup(function() {
			var val = $(this).val();
			$("#reserveMemo").val(val);
		});
		//날짜변경 선택한경우
		$("#reserveDates").change(
				function() {
					var reserveDate = $(this).val();
					var campNo = $("#campNo").val();
					location.href = "/reserveWriteFrm.do?campNo=" + campNo
							+ "&date=" + reserveDate;

				});
		

		//몇박몇일 선택한경우
		$('.usingNight').change(function() {
			var idx = $('.usingNight').index($(this));
			if ($('.siteChkbx').eq(idx).is(':checked')) {
				var total = getSumTr(idx);
				printSum(idx, total);
				printTotal();
				var usNight = $(".usingNight").eq(idx).val();
				$(".listUsingNight").eq(idx).val(usNight);
			}
		});
		//이용인원 선택한경우
		$('.usingCnt').change(function() {
			var idx = $('.usingCnt').index($(this));
			if ($('.siteChkbx').eq(idx).is(':checked')) {
				var total = getSumTr(idx);
				printSum(idx, total);
				printTotal();
				var usingCnt = $(".usingCnt").eq(idx).val();
				$(".listUsingCnt").eq(idx).val(usingCnt);
			}
		});
		//추가차량 기간 선택박스 변경
		$('.addCarDay').change(function() {
			if ($('.carChkbx').is(':checked')) {
				var total = getSumCar();
				printSumCar(total);
				printTotal();
				var carday = $(".addCarDay").val();//주차기간
				$(".listAddCarDay").val(carday);
			}
		});
		//추가차량 대수 선택박스 변경
		$('.addCarCnt').change(function() {
			if ($('.carChkbx').is(':checked')) {
				var total = getSumCar();
				printSumCar(total);
				printTotal();
				var carCnt = $(".addCarCnt").val();//차량수
				$(".listAddCarCnt").val(carCnt);
			}
		});
		//추가차량 체크박스 클릭
		$(".carChkbx").click(function() {
			if ($(this).is(':checked')) {
				var total = getSumCar();
				printSumCar(total);
				var carday = $(".addCarDay").val();//주차기간
				var carCnt = $(".addCarCnt").val();//차량수
				$(".listAddCarDay").val(carday);
				$(".listAddCarCnt").val(carCnt);
			} else {
				var sum = 0;
				$("#carSum").html(sum);
				var val = 0;
				$(".listAddCarDay").val(val);
				$(".listAddCarCnt").val(val);
			}
			printTotal();
		});
		//사이트들 합계 구함
		function getSumTr(idx) {
			var usPay = $(".usingPay").eq(idx).val(); //이용금액
			var usNight = $(".usingNight").eq(idx).val(); //이용박수
			var discntPay = $(".discountPay").eq(idx).val(); //연박할인비용
			var usCnt = $(".usingCnt").eq(idx).val(); //이용인원
			var minCnt = $(".minCnt").eq(idx).val(); //기준인원
			var addCntPay = $(".addCntPay").eq(idx).val(); //추가인원비용
			var sum = (usPay * usNight) - ((usNight - 1) * discntPay)
					+ (usNight * (usCnt - minCnt) * addCntPay); //합계 = (이용금액 * 이용박수) -((이용박수-1) * 연박할인비용) + (이용박수 * (이용인원-기준인원) * 추가인원비용)

			return sum;
		}
		//사이트들 합계 표시
		function printSum(idx, total) {
			$(".listReservePay").eq(idx).val(total);
			var don = String(total);
			don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".sumTr").eq(idx).html(don);
		}
		//자동차 합계 구함
		function getSumCar() {
			var carPay = $(".addCarPay").val();//주차비
			var carday = $(".addCarDay").val();//주차기간
			var carCnt = $(".addCarCnt").val();//차량수
			var sum = (carPay * carday * carCnt);//합계 = (주차비 * 기간 * 차량수)

			return sum;
		}
		//자동차 합계 표시
		function printSumCar(total) {
			var don = String(total);
			don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#carSum").html(don);
		}
		//최종 합게 표시
		function printTotal() {
			var total = 0; //초기화
			$(".sumTr").each(function() { //site_name별 합계			
				var str = $(this).html();
				str = str.replace(/[^\d]+/g, "");
				total += Number(str);
			});
			var str2 = $("#carSum").html(); //추가 주차 합계	
			str2 = str2.replace(/[^\d]+/g, "");
			total += Number(str2);
			$("#reservePrice").attr("value", total);
			$("#reserveTotal").attr("value", total);
			var don = String(total);
			don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");//그 총계를 천단위 구분기호를 넣는다.
			$("#total").html(don);//그리고 총계를 화면에 출력한다.
			getSiteArr(); //사이트들 값 최신화
			console.log("siteCnt = "+siteCnt);
			if(siteCnt>0){
				checkSite = true;
			}else{
				checkSite = false;
			}
			console.log("checkSite = "+checkSite);
		}
		//체크한 사이트 리스트 반환
		function getSiteArr() {
			var siteArr = new Array();
			$(".siteChkbx").each(function(idx, item) {
				if ($(item).is(':checked')) {
					var site = new Array();
					var siteNo = $(".listSiteNo").eq(idx).val();
					var campNo = $(".listCampNo").eq(idx).val();
					var siteTitle = $(".listSiteTitle").eq(idx).val();
					var siteName = $(".listSiteName").eq(idx).val();
					var minCnt = $(".listMinCnt").eq(idx).val();
					var maxCnt = $(".listMaxCnt").eq(idx).val();
					var minNight = $(".listMinNight").eq(idx).val();
					var maxNight = $(".listMaxNight").eq(idx).val();
					var discountPay = $(".listDiscountPay").eq(idx).val();
					var addCntPay = $(".listAddCntPay").eq(idx).val();
					var addCarPay = $(".listAddCarPay").eq(idx).val();
					var usingCnt = $(".listUsingCnt").eq(idx).val(); //수동입력
					var usingPay = $(".listUsingPay").eq(idx).val(); //수동입력 성수기or비수기or극성수기 주말/평일 구분해서 이용금액이 바뀐다
					var usingNight = $(".listUsingNight").eq(idx).val(); //수동입력
					var addCarDay = $(".listAddCarDay").eq(idx).val(); //수동입력
					var addCarCnt = $(".listAddCarCnt").eq(idx).val(); //수동입력
					//var memberNo = $(".listMemberNo").eq(idx).val();
					var memberNo = $("#memberNo").val();
					var reservePay = $(".listReservePay").eq(idx).val();
					var reserveDate = $(".listReserveDate").eq(idx).val();
					var lowDayPay = $(".listLowDayPay").eq(idx).val();
					var lowEndPay = $(".listLowEndPay").eq(idx).val();
					var peakDayPay = $(".listPeakDayPay").eq(idx).val();
					var peakEndPay = $(".listPeakEndPay").eq(idx).val();
					var polarDayPay = $(".listPolarDayPay").eq(idx).val();
					var polarEndPay = $(".listPolarEndPay").eq(idx).val();

					site.push(siteNo);
					site.push(campNo);
					site.push(siteTitle);
					site.push(siteName);
					site.push(minCnt);
					site.push(maxCnt);
					site.push(minNight);
					site.push(maxNight);
					site.push(discountPay);
					site.push(addCntPay);
					site.push(addCarPay);
					site.push(usingCnt);
					site.push(usingPay);
					site.push(usingNight);
					site.push(addCarDay);
					site.push(addCarCnt);
					site.push(memberNo);
					site.push(reservePay);
					site.push(reserveDate);
					site.push(lowDayPay);
					site.push(lowEndPay);
					site.push(peakDayPay);
					site.push(peakEndPay);
					site.push(polarDayPay);
					site.push(polarEndPay);

					siteArr.push(site);
				}				
			});
			$("#siteArr").val(siteArr);	
		}

		//로그인 체크
		/* function checkLogin(){
			var loginBool = false;
			
			if(val != ''){
				loginBool = true;
			}
			return loginBool;
		}
		 */
		//체크한 사이트 있는지 확인
		function checkSite(){
			var siteBool = false;
			var cnt = 0;
			$(".siteChkbx").each(function(idx, item) {
				if ($(this).eq(idx).is(':checked')) {
					cnt++;
				}
			});
			if (cnt > 0) {
				siteBool = true;
			} 
			return siteBool;
		}
		//input박스 확인
		checkReg = [ false, false ];
		function checkInput(){
			var inputBool = false;
			var regChk = 0;
			for (var i = 0; i < checkReg.length; i++) {
				if (checkReg[i] == true) {
					regChk++;
				}
			}
			if (regChk == 2 ) {
				inputBool = true;
			}	
			return inputBool;
		}		
		siteCnt = 0;
		//사이트체크박스에 클릭한경우		
		$('.siteChkbx').click(function() {
			var idx = $('.siteChkbx').index($(this));
			if ($(this).is(':checked')) {
				siteCnt++;
				var total = getSumTr(idx);
				printSum(idx, total);
				var usingNight = $(".usingNight").eq(idx).val();
				$(".listUsingNight").eq(idx).val(usingNight);
				var usingCnt = $(".usingCnt").eq(idx).val();
				$(".listUsingCnt").eq(idx).val(usingCnt);
				var date = $("#date").val();
				$(".listReserveDate").eq(idx).val(date);
				var memberNo = $("#memberNo");
				if (memberNo == '') {
					memberNo = 9999;
				}
				$(".listMemberNo").eq(idx).val(memberNo);

			} else {
				siteCnt--;
				var zero = 0;
				$(".sumTr").eq(idx).html(zero);
				var date = '0000-00-00';
				$(".listReserveDate").eq(idx).val(date);
				$(".listMemberNo").eq(idx).val(zero);
			}
			printTotal();
		});
		checkSite = false;
		//예약하기 버튼 submit전에 거치는 함수
		function reserveInsert(){
			var totalBool = false;	
			var siteBool = checkSite;
			var inputBool = checkInput();
			var msg ="";
			if(!siteBool){
				msg += " 사이트 ";
			}
			if(!inputBool){
				msg += " 예약정보 ";
			}
			if(msg.length>0){
				msg += "확인 해주세요";
				alert(msg);
			}else{
				totalBool = true;
			}			
			return totalBool;
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>