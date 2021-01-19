<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 호출 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- ↓ 결제 모듈 API -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>결제하기</title>
</head>
<body>
	<input type="hidden" name="date" id="date" value="${date }">
	<input type="hidden" name="campNo" id="campNo" value="${camp.campNo }">
	<input type="hidden" name="total" id="total" value="${total }">
	<c:forEach items="${reserveList }" var="r">
		<input type="hidden" name="reserveNo" class="numbers" value="${r.reserveNo }"><br>
	</c:forEach>
	<script>
	
	 $(function(){
		 var numbers = new Array();
		 $(".numbers").each(function(idx, item) {
			 var number = $(".numbers").eq(idx).val();
	         var result = String(number);
	         numbers[idx] = result;
		 });
		 var date = $("#date").val();
		 var campNo = $("#campNo").val();
		 
		var price = $("#total").val();		
		var priceName = '${camp.campName}'+' 예약';
		var memberEmail = '${sessionScope.m.memberEmail}';
		var memberName = '${sessionScope.m.memberName}';
		var memberPhone = '${sessionScope.m.memberPhone}';
   		var d = new Date();
   		var date = d.getFullYear()+" "+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
   		IMP.init("imp32601368");
   		IMP.request_pay({
   			merchant_uid : '상품명_'+date, //상점거래 ID
   			name : priceName,			//결제이름
   			amount : price,					//결제금액
   			buyer_email : memberEmail,//구매자 email
   			buyer_name : memberName,		//구매자이름
   			buyer_tel : memberPhone	//구매자 전화번호   		
   		},function(rsp){
   			if(rsp.success){ //결제가 성공한 경우
   				location.href = "/flexAllRserve.do?numbers='"+numbers+"'&date=${date}&campNo="+campNo;
   			}else{			//결제가 실패한 경우
   				location.href = "/reserveWriteFrm.do?campNo="+campNo+"&date=${date}";   				
   			}
   		}); 
      });
	</script>
</body>
</html>