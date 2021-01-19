<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Fonts -->
<html lang="kr">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- CSS -->
	<link href="../css/common/header.css" type="text/css" rel="stylesheet">
	
    <div class="header-all-wrap">
        <div class="header-title">
            <pre id="header-title-text">새 로 운     캠 핑 문 화 를     함 께    만 들 어     갈     사 람 들 을     기 다 립 니 다</pre>
        </div>
        <div class="header-wrap">
            <div class="header-user">
                <ul>
                <c:choose>
                	<c:when test="${sessionScope.m == null }">
                    	<li><a href="/loginFrm.do">LOGIN</a></li>
                    	<li><a href="/joinFrm.do">JOIN</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="/logout.do">LOGOUT</a></li>
                		<c:choose>
	                    	<c:when test="${sessionScope.m.memberGrade eq 2 }">
			                    <li><a href="/operatorpage.do">OPERATOR</a></li>
			                </c:when>
			                <c:otherwise>
		                    	<li>
		                    		<a href="/mypage.do?memberNo=${sessionScope.m.memberNo }&memberId=${sessionScope.m.memberId }">MYPAGE</a>
		                    	</li>
	                    	</c:otherwise>
                    	</c:choose>
                	</c:otherwise>
                </c:choose>   
                    <li>
                    	<a href="https://korean.visitkorea.or.kr/notice/news_detail.do?nwsid=a517d805-779b-418c-a347-26e8c5642c8c" target="_blank">COVID19-GUIDE</a>
                    </li>
                </ul>
            </div>
            <div class="header-logo">
                    <div class="logo-text-left">create</div>
                    <div class="logo-img"><!--  a href="/"--><img src="resources/upload/common/tentb.png"><!-- /a--></div>
                    <div class="logo-text-right">camp</div>
            </div>
            <div class="header-navi">
                <ul>
                    <li><a href="/notice/noticeList.do?reqPage=1">공지사항</a></li>
                    <li><a href="/campList.do?reqPage=1">캠핑장예약</a></li>
                    <li><a href="/reviewList.do?reqPage=1">캠핑후기</a></li>
                    <li><a href="/usedPage.do?reqPage=1">중고거래</a></li>
                </ul>
            </div>
        </div>
    </div>

</body>
</html>