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
                    <p class="title">전체사용자정보</p>
                   
                    <table class="table table-hover">
                        <tr class="contentsLine">
                            <th>번호</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>ID</th>
                            <th>PW</th>
                            <th>EMAIL</th>
                            <th>등록날짜</th>
                        </tr>
						<c:forEach items="${list }" var="m">
						<tr>
                        	<td>${m.memberNo }</td>
                        	<td>${m.memberName }</td>
                        	<td>${m.memberPhone }</td>
                        	<td>${m.memberId }</td>
                        	<td>${m.memberPw }</td>
                        	<td>${m.memberEmail }</td>
                        	<td>${m.memberRegDate }</td>
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