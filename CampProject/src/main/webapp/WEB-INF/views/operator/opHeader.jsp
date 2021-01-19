<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<link href="../css/operator/header.css" type="text/css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
        <div id="op_navi">
            <span style="float: left;font-size: 40px;text-align: center;">
                <a href="/campList.do?reqPage=1">CREATE<img src="resources/upload/common/tentw.png">CAMP</a>
            </span>
            <span style="float: right; height: 100%;">
                <ul id="header_menu">
                    <a href="campList.do?reqPage=1">
                        <li>MAINPAGE</li>
                    </a>
                    <a href="/operatorpage.do">
                        <li>OPERATOR</li>
                    </a>
                    <c:if test="${sessionScope.m !=null }">
                    	<a href="/opMypage.do?memberNo=${sessionScope.m.memberNo }&memberId=${sessionScope.m.memberId }">
	                        <li>MYPAGE</li>
	                    </a>
	                    <a href="/logout.do">
	                        <li>LOGOUT</li>
	                    </a>
                    </c:if>
                </ul>
            </span>
        </div>
        <div id="header_img">
            <br><br><br><br><br>
            <h2 style="color: white;text-shadow: 1px 1px 1px black"><b>[ 사업자 페이지 ]</b></h2>
            <h6 style="color: white;text-shadow: 1px 1px 1px black"">환영합니다. ${sessionScope.m.memberId}님</h6>
            <div><i class="fas fa-campground"></i></div>
        </div>
    </header>
</body>
</html>