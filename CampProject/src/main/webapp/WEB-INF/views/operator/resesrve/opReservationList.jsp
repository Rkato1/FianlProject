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
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>