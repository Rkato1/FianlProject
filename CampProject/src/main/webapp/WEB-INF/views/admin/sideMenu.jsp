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
    <!-- div class="div1"></div-->
    <div class="menuBox">        
        <a  href="/admin/mainAdmin.do"><img class="circle profile" src="/img/camp.png" width="200px;"></a>
        <div class="profile-title">
            Admin
        </div><br><br>
        <ul class="menu">
            <li>
                <a href="/admin/memberAdmin.do?reqPage=1">회원관리</a>
            </li>
            <li>
                <a href="/admin/businessAdmin.do?reqPage=1">사업자관리</a>
            </li>
            <li>
                <a href="/admin/reserveAdmin.do?reqPage=1">예약관리</a>
            </li>
            <li>
                <a href="/admin/salesAdmin.do?campNo=0&year=0">매출관리</a>
            </li>
            <li>
                <a href="/admin/greatcampAdmin.do?option=reviewPoint">우수캠핑장선정</a>
            </li>
            <li>
                <a href="/admin/helpAdmin.do?option=answer&reqPage=1">고객센터</a>
            </li>
        </ul>
    </div>
    <!-- div class="div1"></div-->
</div>
</body>
</html>