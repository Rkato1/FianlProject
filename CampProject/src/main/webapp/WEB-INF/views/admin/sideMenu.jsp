<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--화면 좌측-->
<div class="admin-menu">
    <div class="div1"></div>
    <div class="menuBox">
        <img class="circle profile" src="img/admin.svg" width="100px;">
        <div class="profile-title">
            admin
        </div><br><br>
        <ul class="menu">
            <li>
                <a href="/">회원관리</a>
            </li>
            <li>
                <a href="/adminMembers?reqPage=1">사업자관리</a>
            </li>
            <li>
                <a href="/reservationAllSearch?reqPage=1">예약관리</a>
            </li>
            <li>
                <a href="/adminQna?reqPage=1">매출관리</a>
            </li>
            <li>
                <a href="/adminQna?reqPage=1">우수캠핑장선정</a>
            </li>
            <li>
                <a href="/adminQna?reqPage=1">고객센터</a>
            </li>
        </ul>
    </div>
    <div class="div1"></div>
</div>
</body>
</html>