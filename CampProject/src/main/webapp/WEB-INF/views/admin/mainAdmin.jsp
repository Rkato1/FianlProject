<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<script src="/js/admin/admin.js"></script>
<body>
    <div class="admin-wrap">
        <!--화면 좌측-->
        <jsp:include page="sideMenu.jsp"/>        
        <!--화면 우측-->
        <div class="admin-content">
            <div class="real-content">
                <div class="members">
                    <p class="title">관리자메인</p>
                </div>
                <div style="display:inline-block; width:49%; box-sizing: border-box;">
                	<img src="/img/admin/noticeImage.jpg" style="width:70%; max-width:540px;"><br>
                	<a href="/noticeList.do?reqPage=1" style="width:100%;font-size:4em;">공지사항 관리</a>
                </div>
                <div style="display:inline-block; width:49%; box-sizing: border-box;">
                	<img src="/img/admin/buisnessImage.jpg" style="width:100%; max-width:540px;"><br>
                	<a href="/operatorpage.do" style="width:100%;font-size:4em;">사업자페이지</a>
                </div>
            </div>
        </div>

    </div> 
</body>
</html>