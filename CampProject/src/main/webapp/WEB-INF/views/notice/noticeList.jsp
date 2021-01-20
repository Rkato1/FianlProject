<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	* {
        font-family: 'Noto Sans KR';
    }    

    .content-wrap {
        width: 1200px;
        margin: 0 auto;
        box-sizing: border-box;
    }

    .titleBox {
        padding-top: 30px;
        padding-bottom: 30px;
    }

    .titleBox>h2 {
        font-weight: bolder;
        padding-bottom: 5px;
    }

    .titleBox>p {
        padding: 0;
        margin: 0;
        color: dimgray;
        font-size: 15px;
    }
    
    
    .titleBox>p:first-child {
    	color: dimgray;
    }
    
    .titleBox>p:last-child {
    	color: #f49b00;
    }
    
    /*--------------------------------*/

    .inputBar {
        overflow: hidden;
        padding-top: 30px;
    }

    .searchBox {
        float: right;
        width: 350px;
        padding-bottom: 10px;
    }

    #searchInput,
    #searchBtn {
        outline: none;
        box-shadow: none;
    }

    .writeBox {
        float: right;
        margin-left: 10px;
        color: white;
    }

    #writeBtn {
        background-color: #f49b00;
    }

    #writeBtn>a {
        text-decoration: none;
        color: white;
    }

    input:focus {
        outline: none;
    }

    /*--------------------------------*/

    /*표 너비 설정*/
    .th-1 {
        width: 7%;
    }

    .th-2 {
        width: 23%;
    }

    .th-3 {
        width: 30%;
    }

    .th-4 {
        width: 13%;
    }

    .th-5 {
        width: 17%;
    }

    .th-6 {
        width: 10%;
    }

    #review-a {
        text-decoration: none;
        color: #383a3f;
    }

    #review-a:hover {
        color: #f49b00;
    }

    .point>i {
        color: #ffd56b;
    }
    
    .pageNaviBox {
    	width: 1200px;
    	padding-top: 30px;
    	padding-bottom: 50px;
    	text-align: center;
    }
    
    .form-control:focus {
		border-color: #ced4da !important;
        outline: 0 none !important;
        box-shadow: none !important;
    }

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	    <div class="content-wrap">

        <div class="titleBox">
            <h2>공지사항</h2>
            <p>관리자만 글을 쓸 수 있습니다.</p>
            <p>※ 댓글 기능은 지원하지 않습니다.</p>
        </div>

        <div class="inputBar">
        	<c:if test="${sessionScope.m.getMemberId().equals('admin') }">
            	<div class="writeBox">
                	<button type="button" class="btn" id="writeBtn">
                    	<a href="/noticeWriteFrm.do">글쓰기</a>
                	</button>
            	</div>
			</c:if>
	
            <div class="searchBox">
            </div>
        </div>

        <table class="table table-striped" style="width: 100%; text-align: center;">
            <thead>
            	<tr>
                	<th class="th-1">번호</th>
                	<th class="th-3">제목</th>
                	<th class="th-5">작성자</th>
                	<th class="th-6">작성일</th>
            	</tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }" var="n">
            	<tr>
                	<td>${n.noticeNo }</td>
                	<td>
                		<a id="review-a" href="/noticeView.do?noticeNo=${n.noticeNo }">
                			${n.noticeTitle }
                		</a>
                	</td>
                	<td>${n.noticeWriter }</td>
                	<td>${n.noticeDate }</td>
            	</tr>
            	</c:forEach>
            </tbody>
        </table>

		<div class="pageNaviBox">
        	<div class="pageNavi">${pageNavi }</div>
        </div>
    </div>
    
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>