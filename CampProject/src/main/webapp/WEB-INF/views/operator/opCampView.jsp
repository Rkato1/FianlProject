<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
        <div>
            <div>
                <h2>AAAA캠핑장</h2>
            </div>
            <hr>
            <div id="menu">
                <ul>
                    <a href="/opCampView.do?campNo=${campNo }"><li>캠핑장정보</li></a>
                    <a href="#"><li>예약현황</li></a>
                    <a href="/selectAllCampNotice.do?campNo=${campNo }"><li>공지사항</li></a>
                    <a href="#"><li>리뷰관리</li></a>
                </ul>
            </div>
            <div class="content">
            </div>
        </div>
     </section>
</body>
</html>