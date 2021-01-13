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

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
</head>
<body>
	<header>
        <div id="op_navi">
            <span style="float: left;font-size: 40px;text-align: center;">
                <a href="/">CREATE<img src="resources/upload/common/tentw.png">CAMP</a>
            </span>
            <span style="float: right; height: 100%;">
                <ul id="header_menu">
                    <a href="/">
                        <li>MAINPAGE</li>
                    </a>
                    <a href="/operatorpage.do">
                        <li>OPERATOR</li>
                    </a>
                    <a href="/logout.do">
                        <li>LOGOUT</li>
                    </a>
                </ul>
            </span>
        </div>
        <div id="header_img">
            <br><br><br><br>
            <h1 style="color: white;"><b>[ 사업자  ] ${m.memberId}님</b></h1>
            <div><i class="fas fa-campground"></i></div>
        </div>
    </header>
</body>
</html>