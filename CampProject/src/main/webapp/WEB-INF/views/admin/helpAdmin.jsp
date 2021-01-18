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
<!-- 이거 현재는 관리자 댓글제외하곤 다 답변안한거로 옴 -->
<!-- 완벽한 로직을 위해서는 후기글이 관리자 답변된게 있으면 답변한글 -->
<!-- 후기글이 관리자 답변된게 없으면 답변하지 않은글 -->
<!-- 페이징 처리까지 해야됨-->
<!-- select-option으로 분할하기 -->
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
                	<select id="option">
				   		<option value="answer">답변한 글들</option>
				   		<option value="notanswer">답변하지 않은 글들</option>
				   	</select>
				   	<button id="okBtn" onclick="setValues()">조회</button>
				   	
				   	<c:choose>
				   		<c:when test="${option eq notanswer }">
	                    <p class="title">답변하지 않은 글들</p>                   
	                    <table class="table table-hover">
	                        <tr>
	                            <th>댓글번호</th>
	                            <th>구분<br>1=댓글, 2=대댓글</th>
	                            <th>댓글작성자</th>
	                            <th>댓글내용</th>
	                            <th>후기글번호</th>
	                            <th>원본댓글번호</th>
	                            <th>댓글작성일</th>
	                        </tr>
	                        <c:forEach items="${list }" var="rc">
							<tr>
	                        	<td>${rc.reviewCommentNo}</td>
	                        	<td>${rc.reviewCommentLevel}</td>
	                        	<td>${rc.reviewCommentWriter}</td>
	                        	<td>${rc.reviewCommentContent}</td>
	                        	<td>${rc.reviewNo}</td>
	                        	<td>${rc.reviewCommentRef}</td>
	                        	<td>${rc.reviewCommentDate}</td>
	                       	</tr>
	                       	</c:forEach>
	                    </table>
	                    <div id= "pageNavi"></div>
	                    </c:when>
	                    <c:when test="${option eq answer }">
	                    <p class="title">답변한 글들</p>                   
	                    <table class="table table-hover">
	                        <tr>
	                            <th>댓글번호</th>
	                            <th>구분<br>1=댓글, 2=대댓글</th>
	                            <th>댓글작성자</th>
	                            <th>댓글내용</th>
	                            <th>후기글번호</th>
	                            <th>원본댓글번호</th>
	                            <th>댓글작성일</th>
	                        </tr>
	                        <c:forEach items="${list }" var="rc">
							<tr>
	                        	<td>${rc.reviewCommentNo}</td>
	                        	<td>${rc.reviewCommentLevel}</td>
	                        	<td>${rc.reviewCommentWriter}</td>
	                        	<td>${rc.reviewCommentContent}</td>
	                        	<td>${rc.reviewNo}</td>
	                        	<td>${rc.reviewCommentRef}</td>
	                        	<td>${rc.reviewCommentDate}</td>
	                       	</tr>
	                       	</c:forEach>
	                    </table>	                    
                    	<div id= "pageNavi"></div>
                    	</c:when>
                    </c:choose>
                </div>
            </div>
        </div>

    </div> 
</body>
</html>