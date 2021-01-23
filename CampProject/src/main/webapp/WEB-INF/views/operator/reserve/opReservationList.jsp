<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAC : 사업자 페이지 예약관리</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
		<div> <!-- 섹션아래 div -->
			<div><a href="/operatorpage.do">목록으로</a></div>
        	<hr>
			<div>
				<h2>${camp.campName }</h2>
			</div>
			<hr>
			<div id="menu">
                <ul>
                    <li>캠핑장정보</li>
                    <ul>
                        <a href="/opCampView.do?campNo=${camp.campNo}"><li>캠핑장소개</li></a>
                        <a href="/opCampSite.do?campNo=${camp.campNo }"><li>구역 안내</li></a>
                    </ul>
                    <a href="/opReservation.do?campNo=${camp.campNo }"><li style="border-bottom: 4px solid rgb(250,220,0);">예약현황</li></a>
                    <a href="/opNoticeList.do?campNo=${camp.campNo}&reqPage=1"><li>공지사항</li></a>
                    <a href="/opReviewList.do?campNo=${camp.campNo }&reqPage=1"><li>리뷰관리</li></a>
                </ul>
            </div>
			<div class="content">
				<h4>예약 관리</h4>
				<hr>
				<div>체크인 기준 : <input type="date" name="checkInDate" value="${checkInDate }"></div>
				<br>
				<table class="table table-striped">
                        <tr>
                            <th>예약번호</th>
                            <th>회원번호</th>
                            <th>입실</th>
                            <th>퇴실</th>  
                            <th>사이트</th>
                            <th>예약가격</th>
                            <th>차번호</th>
                            <th>예약메모</th>
                            <th>예약상태</th>
                        </tr>
                        <c:if test="${empty list}">
                        	<tr><th colspan="9" style="text-align: center;">선택하신 날짜에 숙박하는 예약자가 없습니다.</th></tr>
                        </c:if>
                        <c:forEach items="${list }" var="r">
						<tr>
							<td>${r.reserveNo }</td>
							<td>${r.memberNo }</td>
							<td>${r.checkInDate }</td>
							<td>${r.checkOutDate }</td>
							<td>${r.reservePlace }</td>
							<td>${r.reservePrice }</td>
							<td>${r.carNumber }</td>
							<td>${r.reserveMemo }</td>
							<td>${r.reserveStatus }</td>
                       	</tr>
                       	</c:forEach>
                    </table>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(function(){
		$('#menu>ul>li').next().hide();
		console.log('${checkInDate}');
		
	});
	
	function parse(str) {
	    var y = str.substr(0, 4);
	    var m = str.substr(6, 2);
	    var d = str.substr(9, 2);
	    return new Date(y,m-1,d);
	}
	

	출처: https://nine01223.tistory.com/336 [스프링연구소(spring-lab)]
	
	$('#menu>ul>li').click(function(){
 		$(this).next().slideToggle();
 	})
 	$("[name=checkInDate]").change(function(){
 		console.log($(this).val());
 		console.log("checkInDate="+$("[name=checkInDate]").val());
 		location.href="/opReservation.do?campNo=${camp.campNo}&checkInDate="+$("[name=checkInDate]").val();
 	});
	</script>
</body>
</html>