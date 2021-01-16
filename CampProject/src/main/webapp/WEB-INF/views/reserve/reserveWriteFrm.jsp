<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 호출 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>예약상세보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="../css/reserve/reserveWriteFrm.css" type="text/css"
		rel="stylesheet">
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>이용안내</h4>
				<hr>
				<ul>
					<li>예약 가능 시간 : 현재일에서 60일까지 가능합니다.</li>
					<li>예약 장소는 자리지정 방식 입니다.</li>
					<li>예약시 최대 6박 7일까지 예약 가능하며, 사이트/객실은 최대 2개까지 가능합니다.</li>
					<li>2021년 성수기 기간은 2월 11일 ~ 13일,3월 6일, 3월13일, 3월20일, 3월28일 ~ 31일 입니다.</li>
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
					<h4>느티나무구역 자리선택</h4>
					예약일자 : <input type="date" value="${date }"> 사이트 : <select>
						<option value="default" selected>--선택--</option>
						<option value="느티나무구역(1/2)">느티나무구역(1/2)</option>
						<option value="느티나무구역(2/2)">느티나무구역(2/2)</option>
					</select><br>
					<table width="100%" cellpadding="0" cellspacing="1">
						<colgroup width></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="15%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
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
							<c:set var="sel" value="0" />
							<c:forEach items="${siteReserveList }" var="s">
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
								<td class="ln_r ln_b">
									<span id="sta_ea[1]">
										<input type="hidden" name="minCnt" class="minCnt" value="${s.minCnt }">
										${s.minCnt }
									</span>명/${s.maxCnt }명&nbsp;
								</td>
								
								<td class="ln_r ln_b">
								<input type="hidden" name="usingPay" class="usingPay" value="${s.usingPay }">
								<span>
									<fmt:formatNumber value="${s.usingPay }" pattern="#,###" />
								</span>원</td>
								
								
								<td class="ln_r ln_b">
									<span id="dc_price[1]">
										<input type="hidden" class="discountPay" value="${s.discountPay }">
										<fmt:formatNumber value="${s.discountPay }" pattern="#,###" />
									</span>원
								</td>
								<td class="ln_r ln_b">
									<span id="add_price">
										<input type="hidden" class="addCntPay" value="${s.addCntPay }">
										<fmt:formatNumber value="${s.addCntPay }" pattern="#,###" />
									</span>원
								</td>
								<td class="ln_r ln_b"><select class="usingNight">
										<c:forEach var="i" begin="${s.minNight }" end="${s.maxNight}">
											<option value="${i }">${i }박${i+1}일</option>
										</c:forEach>
								</select> / ${s.maxNight }박</td>
								<td class="ln_r ln_b">
								<select name="person[1]" class="usingCnt">
										<c:forEach var="i" begin="${s.minCnt }" end="${s.maxCnt}">
											<option value="${i }">${i }명</option>
										</c:forEach>
								</select></td>
								<td class="ln_r ln_b price"><span class="sumTr">0</span>원
								</td>
								<td class="ln_r ln_b"><c:choose>
										<c:when test="${s.memberNo == 0 }">
											<input type="checkbox" class="siteChkbx" value="1">
										</c:when>
										<c:otherwise>
											<input type="hidden" class="siteChkbx" value="1">
											${s.memberNo }
										</c:otherwise>
									</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<table width="100%" cellpadding="0" cellspacion="1">
						<colgroup width="30%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="20%"></colgroup>
						<colgroup width="20%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
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
								<td class="ln_r ln_b">
									<span id="car_parking_won">
										<input type="hidden" value="${siteReserveList[0].addCarPay }" name="addCarPay" class="addCarPay">
										<fmt:formatNumber value="${siteReserveList[0].addCarPay }" pattern="#,###" />
									</span>원
								</td>
								<td class="ln_r ln_b"><select name="car_parking_day" class="addCarDay">
										<c:forEach var="i" begin="${siteReserveList[0].minNight }" end="${siteReserveList[0].maxNight}">
										<option value="${i }">${i }일</option>
										</c:forEach>
										
								</select></td>
								<td class="ln_r ln_b"><select name="car_parking_ea" class="addCarCnt">
										<option value="1">1대</option>
										<option value="2">2대</option>
										<option value="3">3대</option>
										<option value="4">4대</option>
										<option value="5">5대</option>
								</select></td>
								<td class="ln_r ln_b price">
									<span id="carSum">0</span>원
								</td>
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
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
						<colgroup width="10%"></colgroup>
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
							<td><input type="text" name="user_name" itemname="이름"
								required class="text"></td>
							<td class="section">비밀번호</td>
							<td><input type="text" name="user_pw" itemname="비밀번호"
								class="text" required> &nbsp;<br> <font
								color="#66A2C8">* 8자리 이상, 영문 + 숫자 + 특수문자 조합하여 입력</font></td>
						</tr>
						<tr>
							<td class="section" height="50">핸드폰번호</td>
							<td><input type="text" name="user_hp" id="user_hp"
								itemname="핸드폰 번호" class="text" numeric required> &nbsp;
								<font color="#66A2C8"> '-' 빼고 숫자만 입력.</font></td>
							<td class="section">차량번호</td>
							<td><input type="text" name="user_carno" itemname="차량번호"
								class="text"> &nbsp; <font color="#66A2C8">※ 예)
									01가 1234 전체 입력.</font></td>
						</tr>
						<tr>
							<td class="section" height="50">메모/닉네임</td>
							<td colspan="3"><input type="text" name="user_remark"
								style="width: 99%;" itemname="메모" class="text"></td>
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
				<p class="button">
					<input type="button" style="width: 90%; height: 28px;" value="예약하기">
				</p>
			</div>
		</div>
	</div>
	<script>	
	var reservePay = 0;
	var reserveOne = 0;
	$('.siteChkbx').click(function(){
		var idx = $('.siteChkbx').index($(this));
		if($(this).is(':checked')){
			var total = getSumTr(idx);
			printSum(idx,total);			
		}else{
			var sum = 0;
			$(".sumTr").eq(idx).html(sum);		
		}
		printTotal();
	});	
	
	$('.usingNight').change(function(){		
		var idx = $('.usingNight').index($(this));
		if($('.siteChkbx').eq(idx).is(':checked')){
			var total = getSumTr(idx);
			printSum(idx,total);
			printTotal();
		}
	});
	$('.usingCnt').change(function(){		
		var idx = $('.usingCnt').index($(this));
		if($('.siteChkbx').eq(idx).is(':checked')){
			var total = getSumTr(idx);
			printSum(idx,total);
			printTotal();
		}
	});	
	
	$(".carChkbx").click(function(){
		if($(this).is(':checked')){
			console.log("car체크박스  체크됨");
			var total = getSumCar();
			printSumCar(total);			
		}else{
			console.log("car체크박스 체크해제됨");
			var sum = 0;
			$("#carSum").html(sum);	
		}
		printTotal();
	});
	
	$('.addCarDay').change(function(){		
		if($('.carChkbx').is(':checked')){
			var total = getSumCar();
			printSumCar(total);
			printTotal();
		}
	});
	$('.addCarCnt').change(function(){		
		if($('.carChkbx').is(':checked')){
			var total = getSumCar();
			printSumCar(total);
			printTotal();
		}
	});	
	
	function getSumTr(idx) {
		var usPay = $(".usingPay").eq(idx).val(); //이용금액
		var usNight = $(".usingNight").eq(idx).val(); //이용박수
		var discntPay = $(".discountPay").eq(idx).val(); //연박할인비용
		var usCnt = $(".usingCnt").eq(idx).val(); //이용인원
		var minCnt = $(".minCnt").eq(idx).val(); //기준인원
		var addCntPay = $(".addCntPay").eq(idx).val(); //추가인원비용
		var sum = (usPay * usNight) -((usNight-1) * discntPay) + (usNight * (usCnt-minCnt) * addCntPay) ;	//합계 = (이용금액 * 이용박수) -((이용박수-1) * 연박할인비용) + (이용박수 * (이용인원-기준인원) * 추가인원비용)
		
		return sum;
	}
	function printSum(idx,total){
		var don = String(total);
		don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(".sumTr").eq(idx).html(don);
	}
	function getSumCar() {
		var carPay = $(".addCarPay").val();//주차비
		var carday= $(".addCarDay").val();//주차기간
		var carCnt= $(".addCarCnt").val();//차량수
		var sum = (carPay*carday*carCnt);//합계 = (주차비 * 기간 * 차량수)
		
		return sum;
	}
	function printSumCar(total){
		var don = String(total);
		don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#carSum").html(don);	
	}
	function printTotal(){		
		var total = 0;  //초기화
		$(".sumTr").each(function(){ //site_name별 합계			
			var str = $(this).html();
			str = str.replace(/[^\d]+/g, "");
			total += Number(str);
		});	
		var str2 = $("#carSum").html(); //추가 주차 합계	
		str2 = str2.replace(/[^\d]+/g, "");
		total += Number(str2);
		var don = String(total);
		don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");//그 총계를 천단위 구분기호를 넣는다.
		$("#total").html(don);//그리고 총계를 화면에 출력한다.
	}
	</script>
	
</body>
</html>