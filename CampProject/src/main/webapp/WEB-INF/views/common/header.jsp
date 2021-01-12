<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<!-- Google Fonts -->
<html lang="kr">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    	
    	html,
        body {
            margin: 0;
            padding: 0;
        }
    
    	.header-all-wrap {
    		margin-bottom: 80px;
    	}

        .header-title {
            width: 100%;
            background-color: #1d0e0e;
            text-align: center;
            height: 42px;
            line-height: 42px;
        }

        #header-title-text {
            font-family: 'Noto Sans KR';
            font-size: 0.9em;
            margin: 0;
            color: #f49b00;
            
        }

        /*---------------------------------------*/

        .header-wrap {
            /*border-bottom: 2px solid #f49b00;*/
            background-color: #fafafa;
        }
        
        /*---------------------------------------*/
        
        .header-user {
            height: 37px;
            overflow: hidden;
        }

        .header-user>ul {
            list-style: none;
            padding: 0px;
            overflow: hidden;
            float: right;
            padding-right: 30px;
        }

        .header-user>ul>li {
            float: left;
            padding-left: 18px;

        }

        .header-user>ul>li>a {
            text-decoration: none;
            font-family: 'Noto Sans KR';
            font-size: 15px;
            color: #848484;
        }

        .header-user>ul>li>a:hover {
            font-weight: bolder;
        }

        /*---------------------------------------*/

        .header-logo {
            overflow: hidden;
            width: 680px;
            margin: 0 auto;
            margin-top: 40px;
            margin-bottom: 30px;
        }

        .logo-text {
            font-family: 'Russo One';
            font-size: 85px;
            float: left;
            padding-left: 15px;
            padding-right: 15px;
        }

        .logo-img {
            width: 90px;
            height: 90px;
            float: left;
        }

        .logo-img>img {
            width: 100%;
            height: 100%;
        }

        /*---------------------------------------*/

        .header-navi {
            padding-bottom: 35px;
            /* 전체 구분선
            border-bottom: 2px solid #d3d3d3;
            */
        }

        .header-navi>ul {
            list-style: none;
            overflow: hidden;
            width: 825px;
            margin: auto;
            padding: 0;
        }

        .header-navi>ul>li {
            float: left;
            width: 200px;
            padding: 0px;
            border-left: 2px solid #1d0e0e;
        }

        .header-navi>ul>li:last-child {
            border-right: 2px solid #1d0e0e;
        }


        .header-navi>ul>li>a {
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            text-align: center;
            font-size: 16px;
            font-weight: bolder;
            color: #1d0e0e;
            box-sizing: border-box;
            font-family: 'Noto Sans KR';
            display: inline-block;
        }

        .header-navi>ul>li>a:hover {
            color: #f49b00;
            font-weight: bolder;
        }
    </style>
</head>
<body>
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
                		<li>${sessionScope.m.memberGrade}</li>
                		<c:choose>
		                	<c:when test="${sessionScope.m.memberGrade ne 2 }">
		                    	<li><a href="/mypage.do?memberNo=${sessionScope.m.memberNo }">MYPAGE</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li><a href="/operatorpage.do">OPERATOR</a></li>
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
                    <div class="logo-text">create</div>
                    <div class="logo-img"><img src="resources/upload/common/tentb.png"></div>
                    <div class="logo-text">camp</div>
            </div>
            <div class="header-navi">
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="/campList.do?reqPage=1">캠핑장예약</a></li>
                    <li><a href="/reviewList.do">캠핑후기</a></li>
                    <li><a href="/usedPage.do">중고거래</a></li>
                </ul>
            </div>
        </div>
    </div>

</body>
</html>