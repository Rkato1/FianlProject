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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>예약 상세히 보기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reserve/reserveUpdateFrm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content">
		<div class="items">
			<div class="item">
				<h4>예약자 정보</h4>
				<form action="/updateReserve.do" method="post" onsubmit="return reserveUpdate();">
					<input type="hidden" id="reserveNo" name="reserveNo"
						value="${reserve.reserveNo }">
					<table class="infomation table" width="100%">
						<colgroup>
							<col class="col01">
							<col class="col02">
							<col class="col01">
							<col class="col02">
						</colgroup>
						<tbody>
							
							<tr>
								<td class="section ln_r" height="50" width="100">
									이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
								<td class="ln_r center" width="250">
									<div class="inputDiv">
										<input type="text" name="memberName" value="${member.memberName }" class="inputBox readonly" readonly required>
										<span class="inputSpan"><font color="#66A2C8">&nbsp; 수정불가</font></span>
									</div>
								</td>
								<td class="section ln_r" width="100">예약암호</td>
								<td class="center" width="400">
									<div class="inputDiv">
										<input type="text" id="inputPw" name="reservePw"	value="${reserve.reservePw }" class="inputBox" required>
										<span class="inputSpan"><font color="#66A2C8">&nbsp; 6~18자리 영어 대소문자/숫자 조합</font></span>
									</div>
								</td>
							</tr>

							<tr>
								<td class="section ln_r" height="50">핸드폰번호</td>
								<td class="ln_r center">
									<div class="inputDiv">
										<input type="text" name="memberPhone" value="${member.memberPhone }" class="inputBox readonly" readonly required>
										<span class="inputSpan"><font color="#66A2C8">&nbsp; 수정불가</font></span>
									</div>
								</td>
								<td class="section ln_r">차량번호</td>
								<td class="center">
									<div class="inputDiv">
										<input type="text" id="inputCarNumber" name="carNumber" value="${reserve.carNumber }" class="inputBox">
										<span class="inputSpan"><font color="#66A2C8">&nbsp; ※ 예) 01가 1234, 서울 01가 1234</font></span>
									</div>
								</td>
							</tr>

							<tr>
								<td class="section ln_r" height="50">메모/닉네임</td>
								<td colspan="3" class="center">
									<div class="inputDiv">
										<input type="text" id="inputMemo" name="reserveMemo" style="width: 99%;" value="${reserve.reserveMemo }">
									</div>
								</td>
							</tr>

							<tr>
								<td colspan="6" style="text-align: center"><input class="btn btn-outline-dark btn-sm" id="updateBtn"
									type="submit" style="width: 90%; height: 28px;" value="수정하기">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="item">
				<br>
				<h4>예약사항</h4>
				<table class="table table-striped" width="100%" cellpadding="0" celSpacing="1">
					<colgroup width></colgroup>
					<colgroup width="10%"></colgroup>
					<colgroup width="30%"></colgroup>
					<colgroup width="20%"></colgroup>
					<colgroup width="10%"></colgroup>
					<colgroup width="10%"></colgroup>
					<tbody>
						<tr class="pdLlnb1 bg b center">
							<td class="ln_t ln_r ln_l ln_b b" height="25">예약장소</td>
							<td class="ln_t ln_r ln_b b">기준인원</td>
							<td class="ln_t ln_r ln_b b">예약기간</td>
							<td class="ln_t ln_r ln_b b">예약 인원</td>
							<td class="ln_t ln_r ln_b b">합계</td>
							<td class="ln_t ln_r ln_b b">상태</td>
						</tr>
						<tr class="list0 col1 ht center">
							<td class="ln_r ln_l ln_b">${site.siteName }</td>
							<td class="ln_r ln_b">${site.minCnt }명/${site.maxCnt }명</td>
							<td class="ln_r ln_b">${reserve.checkInDate }~
								${reserve.checkOutDate } (${site.usingNight }박${site.usingNight+1 }일)
							</td>
							<td class="ln_r ln_b">${site.usingCnt }명(추가인원:
								${site.usingCnt - site.minCnt } 명)</td>
							<td class="ln_r ln_b" style="color: #FF0000;">${site.reservePay}원
								<input type="hidden" value="${site.reservePay}"
								name="reservePrice" id="reservePrice">
							</td>
							<td class="ln_r ln_b">${reserve.reserveStatus }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="item" style="text-align: center;">
				<br> <input type="button" class="btn btn-outline-dark btn-sm" style="width: 45%; height: 28px;"
					value="취소하기"
					onclick="location.href='/reserveDelete.do?reserveNo=${reserve.reserveNo}&campNo=${reserve.campNo }&checkInDate=${reserve.checkInDate }'">
				<input type="button" class="btn btn-outline-dark btn-sm" style="width: 45%; height: 28px;" value="목록보기"
					onclick="location.href='/reserveWriteFrm.do?campNo=${reserve.campNo}&date=${site.reserveDate }'">
			</div>
			<div class="item">
				<br>
				<h4>준수사항</h4>
				<hr>
				<ul>
					<li>▶ <b>예약 준수 사항</b></li>
					<li>-예약전 예약주수항 및 환불정책를 꼭 필독하시고 예약하시기 바랍니다.</li>
					<li>예약취소는 캠퍼분이 직접 예약달력창 우측 상단 "확인/취소"> 환불요청 하시면 됩니다.</li>
					<li>환불시 제차 동의 받는 것과 같이 7일 이후 월요일(최대15일)에 처리됩니다.</li>
				</ul>
			</div>
			<c:choose>
				<c:when test="${reserve.reserveStatus == '결제대기' }">
					<div class="item">
						<br>
						<h3>결제하기</h3>
						<input type="checkbox" id="mustChk"> (필수) 위 사항에 변동이 없습니다.
						<p class="button">
							<input type="button" id="flex" style="width: 90%; height: 28px;" class="btn btn-outline-dark btn-sm"
								value="결제하기">
						</p>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>

	<script>
	
		$("#flex").click(
				function() {
					if ($("#mustChk").is(':checked')) {
						var price = $("#reservePrice").val();
						var d = new Date();
						var date = d.getFullYear() + " " + (d.getMonth() + 1)
								+ '' + d.getDate() + '' + d.getHours() + ''
								+ d.getMinutes() + '' + d.getSeconds();
						IMP.init("imp32601368");
						IMP.request_pay({
							merchant_uid : '상품명_' + date, //상점거래 ID
							name : '${reserve.reservePlace}' + ' 예약', //결제이름
							amount : price, //결제금액
							buyer_email : '${sessionScope.m.memberEmail }',//구매자 email
							buyer_name : '${sessionScope.m.memberName }', //구매자이름
						}, function(rsp) {
							if (rsp.success) {
								//결제가 성공함
								var rserveNo = $("#reserveNo").val();
								location.href = '/flexOneRserve.do?reserveNo='
										+ reserveNo;
								//예약완료(예약+결제완료된상태)로 설정
							} else {
								//결제가 실패함
								alert('결제 실패');
								//결제대기(예약완료 결제미완료)로 설정
							}
						});
					} else {
						//필수항목 체크 안함
						alert('필수항목을 체크해주세요');
					}
				});
		
		$(function() {
			//예약암호 체크
			$("#inputPw").change(
					function() {
						check[0] = false;
						var reg = /^[A-Za-z0-9_-]{6,18}$/;
						if (reg.test($(this).val())) {
							check[0] = true;
							var comment = '&nbsp; 올바르게 입력하셨습니다';
							$(".inputSpan").eq(1).children().first().html(
									comment);
							$(".inputSpan").eq(1).children().first().attr(
									'color', 'green');
							$("#inputPw").css('border', '2px solid green');
						} else {
							check[0] = false;
							var comment = '&nbsp; 6~18자리 영어 대소문자/숫자 조합';
							$(".inputSpan").eq(1).children().first().html(
									comment);
							$(".inputSpan").eq(1).children().first().attr(
									'color', 'red');
							$("#inputPw").css('border', '2px solid red');
						}
					});
			//차량번호 체크
			$("#inputCarNumber").change(function() {
				check[1] = false;
				var val = $('#inputCarNumber').val();
	            var reg = /^[0-9]{2}[가-힣]{1}[\s]*[0-9]{4}$/;//신 : 11가 1234
	            var reg2 = /^[가-힣]{2}[\s]*[0-9]{2}[가-힣]{1}[\s]*[0-9]{4}$/; //구 : 서울 11가 1234
	            if(reg.test(val)){
	                 check[1] = true;
					    var comment = '&nbsp; 올바르게 입력하셨습니다';
					    $(".inputSpan").eq(3).children().first().html(comment);
					    $(".inputSpan").eq(3).children().first().attr('color','green');
					    $("#inputCarNumber").css('border', '2px solid green');
	            }else{
	                if(reg2.test(val)){
	                   check[1] = true;
					    var comment = '&nbsp; 올바르게 입력하셨습니다';
					    $(".inputSpan").eq(3).children().first().html(comment);
					    $(".inputSpan").eq(3).children().first().attr('color','green');
					    $("#inputCarNumber").css('border', '2px solid green');
	                   
	                }else{
	                    check[1] = false;
					    var comment = '&nbsp; ※ 예) 01가 1234, 서울 01가 1234';
					    $(".inputSpan").eq(3).children().first().html(comment);
					    $(".inputSpan").eq(3).children().first().attr('color','red');
					    $("#inputCarNumber").css('border', '2px solid red');	                    
	                }
	            }
			});
		});
		check = [ true, true ];
		function checkInput(){
			var inputBool = false;
			var regChk = 0;
			for (var i = 0; i < check.length; i++) {
				if (check[i] == true) {
					regChk++;
				}
			}
			if (regChk == 2 ) {
				inputBool = true;
			}	
			return inputBool;
		}	
		function reserveUpdate(){
			var totalBool = false;
			var inputBool = checkInput();
			if(!inputBool){
				var msg = "예약정보를 확인해주세요";
				alert(msg);
			}
			if(inputBool){
				totalBool = true;
			}
			return totalBool;
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>