<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<script src="/js/admin/admin.js"></script>
<!-- 따로 변화하지 않으면 후기에서만 검색 -->
<!-- 로직을 위해서는 후기글이 관리자 답변된게 있으면 답변한글 -->
<!-- 후기글이 관리자 답변된게 없으면 답변하지 않은글 -->
<script>
	function setValues(){
		var option = $("#option option:selected").val();
		console.log(option);
		location.href="/admin/helpAdmin.do?option="+option+"&reqPage=1";		
	}
</script>
<body>
    <div class="admin-wrap">
        <!--화면 좌측-->
        <jsp:include page="sideMenu.jsp"/>
        <!--화면 우측-->
        <div class="admin-content">
        <p class="title">고객센터</p>
            <div class="real-content">
                <div class="members">
                	<select class="option" id="option">
				   		<option value="answer">답변한 글들</option>
				   		<option value="notanswer">답변하지 않은 글들</option>
				   	</select>
				   	<button id="okBtn" onclick="setValues()">조회</button>
				   	
				   	<!-- 왜인지는 모르겠는데 p태그가 c:when에 안먹힘; -->
				   	<p class="title">${title }</p>
				   	<c:choose>
				   		<c:when test="${option eq notanswer }">
				   		
	                    <table class="table table-hover">
	                        <tr>
	                            <th>글번호</th>
	                            <th>글작성자</th>
	                            <th>예약번호</th>
	                            <th>글제목</th>
	                            <th>내용</th>
	                            <th>작성일자</th>
	                            <th>평점</th>
	                            <th>캠프번호</th>
	                        </tr>
	                        <c:forEach items="${list }" var="rc">
							<tr>
	                        	<td>${rc.reviewNo}</td>
	                        	<td>${rc.memberId}</td>
	                        	<td>${rc.reserveNo}</td>
	                        	<td><a href="/reviewView.do?reviewNo=${rc.reviewNo }&campNo=${rc.campNo}">${rc.reviewTitle}</a></td>
	                        	<td>${rc.reviewContent}</td>
	                        	<td>${rc.reviewDate}</td>
	                        	<td>${rc.reviewPoint}</td>
	                        	<td>${rc.campNo}</td>
	                       	</tr>
	                       	</c:forEach>
	                    </table>
	                    <div id= "pageNavi">${pageNavi }</div>
	                    </c:when>
	                    <c:when test="${option eq answer }">
	                                                      
	                    <table class="table table-hover">
	                        <tr>
	                            <th>글번호</th>
	                            <th>글작성자</th>
	                            <th>예약번호</th>
	                            <th>글제목</th>
	                            <th>내용</th>
	                            <th>작성일자</th>
	                            <th>평점</th>
	                            <th>캠프번호</th>
	                        </tr>
	                        <c:forEach items="${list }" var="rc">
							<tr>
	                        	<td>${rc.reviewNo}</td>
	                        	<td>${rc.memberId}</td>
	                        	<td>${rc.reserveNo}</td>
	                        	<td><a href="/reviewView.do?reviewNo=${rc.reviewNo }&campNo=${rc.campNo}">${rc.reviewTitle}</a></td>
	                        	<td>${rc.reviewContent}</td>
	                        	<td>${rc.reviewDate}</td>
	                        	<td>${rc.reviewPoint}</td>
	                        	<td>${rc.campNo}</td>
	                       	</tr>
	                       	</c:forEach>
	                    </table>	                    
                    	<div id= "pageNavi">${pageNavi }</div>
                    	</c:when>
                    </c:choose>
                </div>
            </div>
        </div>

    </div>
    <script>
    	$("#option").val('${option}').attr("selected","selected");
    </script>
</body>
</html>