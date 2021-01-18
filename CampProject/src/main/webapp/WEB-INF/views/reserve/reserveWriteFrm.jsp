<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 호출 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- ↓ 결제 모듈 API -->
<!-- <script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->
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
<style>
#myModal {
	top: 30%;
	margin-top: -50px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="../css/reserve/reserveWriteFrm.css" type="text/css"
		rel="stylesheet">		
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content modal-dialog-centered">
				<form method="post" action = "/searchOneReserve.do">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">예약 확인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<input type="hidden" id="modalNo"  name="reserveNo">
				<input type="hidden" name="campNo" value="${camp.campNo }">
				<input type="hidden" name="date" value="${date }">
				<div class="modal-body">예약 비밀번호 : <input type="text" id="modalPw" name="reservePw" required></div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	<div class="container">
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
				<h4>예약선택</h4>
				<hr>
				<div class="item">
					<h4>캠핑장 배치도</h4>
					<img src="resources/upload/camp/layout_01.jpg"
						style="width: 100%; height: 400px;">
				</div>
				<div class="item">
					<h4>자리선택</h4>
					예약일자 : ${date }<br>
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
											<button type="button" class="modalbtn btn btn-primary" value="${reserveList[rIdx].reserveNo }"
												data-toggle="modal" data-target="#myModal" style="height:30px;">확인</button>
											<c:set var="rIdx" value="${rIdx+1 }" />
										</c:otherwise>
									</c:choose>									
									</td>
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
									<c:when test="${sessionScope.m != null }">
										<input type="hidden" class="listMemberNo" name="listMemberNo"
											value="${sessionScope.m.memberNo}">
									</c:when>
									<c:otherwise>
										<input type="hidden" class="listMemberNo" name="listMemberNo"
											value="${s.memberNo}">
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
								<td class="ln_r ln_b"><input type="checkbox"
									name="car_parking_check" value="1" class="carChkbx"></td>
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
								<td class="price"><b> <span id="total">0</span>원
								</b></td>
							</tr>
							<tr>
								<td colspan="9" class="line2"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="item">
				<h4>예약자정보</h4>
				<table class="infomation">
					<colgroup>
						<col class="col01">
						<col class="col02">
						<col class="col01">
						<col class="col02">
					</colgroup>
					<tbody>
						<tr>
							<td class="section" height="50">
								이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
							<td><input type="text" id="inputName" name="inputName"
								required class="text" value="${sessionScope.m.memberName }"></td>
							<td class="section">비밀번호</td>
							<td><input type="text" name="inputPw" id="inputPw"
								class="text" required> &nbsp;<br> <font
								color="#66A2C8">* 8자리 이상, 영문 + 숫자 + 특수문자 조합하여 입력</font></td>
						</tr>
						<tr>
							<td class="section" height="50">핸드폰번호</td>
							<td><input type="text" name="inputPhone" id="inputPhone"
								value="${sessionScope.m.memberPhone }" class="text" required>
								&nbsp; <font color="#66A2C8"> '-' 포함 입력.</font></td>
							<td class="section">차량번호</td>
							<td><input type="text" id="inputCarNumber"
								name="inputCarNumber" class="text"> &nbsp; <font
								color="#66A2C8">※ 예) 01가 1234 전체 입력.</font></td>
						</tr>
						<tr>
							<td class="section" height="50">메모/닉네임</td>
							<td colspan="3"><input type="text" id="inputMemo"
								name="inputMemo" style="width: 99%;" itemname="메모" class="text"></td>
						</tr>
					</tbody>
				</table>
			</div>
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
					onsubmit="return checkFrm();">
					<p class="button">
						<input type="hidden" id="siteArr" name="siteArr">
						<c:choose>
							<c:when test="${sessionScope.m != null }">
								<input type="hidden" id="memberNo" name="memberNo"
									value="${sessionScope.m.memberNo }">
							</c:when>
							<c:otherwise>
								<input type="hidden" id="memberNo" name="memberNo" value="9999">
							</c:otherwise>
						</c:choose>
						<input type="hidden" id="memberName" name="memberName">
						<!-- 비회원용 -->
						<input type="hidden" id="campNo" name="campNo" value="${camp.campNo }"> 
						<input type="hidden" id="reservePlace" name="reservePlace" value="${camp.campAddr }">
						<input type="hidden" id="checkInDate" name="checkInDate" value="${date }"> 
						<input type="hidden" id="reservePrice" name="reservePrice">
						<input type="hidden" id="reservePw" name="reservePw"> 
						<input type="hidden" id="carNumber"	name="carNumber"> 
						<input type="hidden" id="reserveMemo" name="reserveMemo"> 
						<input id="reserveBtn" type="submit" style="width: 90%; height: 28px;" value="예약하기"> 
						<input id="reserveBtn2" type="hidden" style="width: 90%; height: 28px;" value="예약하기2">
					</p>
				</form>
			</div>
		</div>
	</div>

	<!-- js파일 호출 -->
	<script src="../js/reserve/reserveWriteFrm.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$('.siteChkbx').click(function() {
		var idx = $('.siteChkbx').index($(this));
		if ($(this).is(':checked')) {
			var total = getSumTr(idx);
			printSum(idx, total);
			var usingNight = $(".usingNight").eq(idx).val();
			$(".listUsingNight").eq(idx).val(usingNight);
			var usingCnt = $(".usingCnt").eq(idx).val();
			$(".listUsingCnt").eq(idx).val(usingCnt);
			var date = '${date }';
			$(".listReserveDate").eq(idx).val(date);
			var memberNo = '${sessionScope.m.memberNo}';
			if (memberNo == '') {
				memberNo = 9999;
			}
			$(".listMemberNo").eq(idx).val(memberNo);

		} else {
			var zero = 0;
			$(".sumTr").eq(idx).html(zero);
			var date = '0000-00-00';
			$(".listReserveDate").eq(idx).val(date);
			$(".listMemberNo").eq(idx).val(zero);
		}
		printTotal();
	});
	$(function() {
		var name = '${sessionScope.m.memberName}';
		$("#memberName").val(name);
	})
	</script>
</body>
</html>