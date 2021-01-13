<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>사업자관리 페이지</title>
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
                    <p class="title">전체사업자정보</p>
                   
                    <table class="table table-hover">
                        <tr>
                            <th>번호</th>
                            <th>이름</th>
                            <th>주소</th>
                            <th>회원번호</th>
                            <th>캠핑장소개</th>                            
                            <th>캠핑장유형</th>
                            <th>문의처</th>
                            <th>운영기간</th>
                            <th>운영일</th>
                            <th>이용가능시설</th>
                            <th>주중요금<br>(일반)</th>                            
                            <th>주말요금<br>(일반)</th>
                            <th>주중요금<br>(성수기)</th>
                            <th>주말요금<br>(성수기)</th>
                        </tr>
                        <c:forEach items="${list }" var="c">
						<tr>
                        	<td>${c.campNo }</td>
                        	<td>${c.campName }</td>
                        	<td>${c.campAddr }</td>
                        	<td>${c.memberNo }</td>
                        	<td>${c.campShow }</td>
                        	<td>${c.campType }</td>
                        	<td>${c.campPh }</td>
                        	<td>${c.campPeriod }</td>
                        	<td>${c.campDay }</td>
                        	<td>${c.campFacility }</td>
                        	<td>${c.campFeeOriDay }</td>
                        	<td>${c.campFeeOriEnd }</td>
                        	<td>${c.campFeePeakDay }</td>
                        	<td>${c.campFeePeakEnd }</td>
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