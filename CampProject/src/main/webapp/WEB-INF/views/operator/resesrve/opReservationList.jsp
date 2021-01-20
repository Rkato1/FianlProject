<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                    <li style="border-bottom: 4px solid rgb(250,220,0);">캠핑장정보</li>
                    <ul>
                        <a href="/opCampView.do?campNo=${camp.campNo}"><li>캠핑장소개</li></a>
                        <a href="/opCampSite.do?campNo=${camp.campNo }"><li style="border-bottom: 4px solid rgb(250,220,0);">구역 안내</li></a>
                    </ul>
                    <a href="/opReservation.do"><li>예약현황</li></a>
                    <a href="/opNoticeList.do?campNo=${camp.campNo}&reqPage=1"><li>공지사항</li></a>
                    <a href="/opReviewList.do?campNo=${camp.campNo }&reqPage=1"><li>리뷰관리</li></a>
                </ul>
            </div>
			<div class="content">
				<table class="table table-hover">
                        <tr>
                            <th>예약번호</th>
                            <th>회원번호</th>
                            <th>캠핑장번호</th>
                            <th>입실일</th>
                            <th>퇴실일</th>                            
                            <th>예약상태</th>
                            <th>예약주소</th>
                            <th>예약가격</th>
                            <th>비밀번호</th>
                            <th>차번호</th>
                            <th>예약메모</th>
                        </tr>
                        <c:forEach items="${list }" var="r">
						<tr>
							<td>${r.reserveNo }</td>
							<td>${r.memberNo }</td>
							<td>${r.campNo }</td>
							<td>${r.checkInDate }</td>
							<td>${r.checkOutDate }</td>
							<td>${r.reserveStatus }</td>
							<td>${r.reservePlace }</td>
							<td>${r.reservePrice }</td>
							<td>${r.reservePw }</td>
							<td>${r.carNumber }</td>
							<td>${r.reserveMemo }</td>
                       	</tr>
                       	</c:forEach>
                    </table>
                    <div id= "pageNavi">${pageNavi }</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>