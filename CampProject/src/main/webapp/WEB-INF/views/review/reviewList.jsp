<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	    <div class="content-wrap">

        <div class="titleBox">
            <h2>캠핑 후기</h2>
            <p>많은 사람들이 공유할 수 있도록 자유롭고 솔직한 후기를 남겨주세요.</p>
            <p>※ 욕설이나 비방글은 동의없이 삭제될 수 있습니다.</p>
        </div>

        <div class="inputBar">
        	<c:if test="${sessionScope.m != null }">
            	<div class="writeBox">
                	<button type="button" class="btn" id="writeBtn">
                    	<a href="/reviewWriteFrm.do">글쓰기</a>
                	</button>
            	</div>
			</c:if>
	
            <div class="searchBox">
            	<form action="/searchKeyword.do?req" method="post">
                	<div class="input-group">
                    	<input type="hidden" name="reqPage" value="1">
                        <input type="text" name="keyword" class="form-control" id="searchInput">
                        <div class="input-group-append">
                            <input type="submit" class="btn btn-dark" id="searchBtn" value="캠핑장 검색">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <table class="table table-striped" style="width: 100%; text-align: center;">
            <thead>
            	<tr>
                	<th class="th-1">번호</th>
                	<th class="th-2">캠핑장</th>
                	<th class="th-3">제목</th>
                	<th class="th-4">별점</th>
                	<th class="th-5">작성자</th>
                	<th class="th-6">작성일</th>
            	</tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }" var="r">
            	<tr>
                	<td>${r.reviewNo }</td>
                	<td>${r.campName }</td>
                	<td>
                		<a id="review-a" href="/reviewView.do?reviewNo=${r.reviewNo }&campNo=${r.campNo }">
                			${r.reviewTitle }
                		</a>
                	</td>
                	<td class="point">
                		<c:forEach var="i" begin="0" end="4">
                			<c:choose>
                				<c:when test="${r.reviewPoint  > i }">
                					<i class="fas fa-star"></i>
                				</c:when>
                				<c:otherwise>
                					<i class="far fa-star"></i>
                				</c:otherwise>
                			</c:choose>
                		</c:forEach>
                	</td>
                	<td>${r.memberId }</td>
                	<td>${r.reviewDate }</td>
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