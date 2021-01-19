<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리 페이지</title>
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
                    <p class="title">전체예약정보</p>
                   
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
        </div>

    </div> 
</body>
</html>