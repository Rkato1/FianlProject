<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 호출 -->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<!-- 글자 호출 검색 아이콘 -->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<meta charset="UTF-8">
<title>캠핑장 리스트</title>
<style>
.container {
	width: 100%;
	display: flex;
	justify-content: center;
}

.items-height {
	width: 100%;
	display: flex;
	flex-direction: column;
}

.items-width {
	display: flex;
	margin-bottom: 10px;
}

.item {
	padding: 5px;
	width: 10vw;
	height: 21vh;
	/* border: 1px solid black;*/
}

img {
	width: 100%;
	height: 9vh;
	vertical-align: middle;
	z-index: 200;
}

.item-top {
	width: 100%;
	background-color: #1D0E0E;
	position: relative;
}

.item-text {
	position: absolute;
	top: 10vh;
	left: 3vw;
	/*border: 1px solid red;*/
	transform: translate(-50%, -50%);
	z-index: 100;
}

.camp_name {
	font-weight: bold;
}

.item-image:hover {
	color: #FA9B00;
}

.item-image {
	color: white;
	font-weight: bold;
	display: block;
}

.camp_button {
	width: 100%;
}

.items-navi {
	text-align: center;
	width: 100%;
	height: 100px;
}

.search-wrap {
	background-color: rgba(0, 0, 0, 0.5);
	width: 60%;
	margin: 0 auto;
	padding: 25px;
	padding-bottom: 30px;
	color: #f49b00;
	overflow: hidden;
}

.search-wrap>div {
	font-family: 'Russo One';
	font-weight: 100;
	font-size: 22px;
	float: left;
	margin-top: 12px;
	margin-right: 30px;
}

.search-where {
	width: 400px;
	margin-left: 25px;
}

.search-where>input {
	margin-top: 8px;
	width: 100%;
	height: 25px;
	outline: none;
	font-size: 15px;
	font-family: 'Noto Sans KR';
}

.search-check {
	width: 230px;
}

.search-check>input, .search-check>select {
	margin-top: 8px;
	width: 100%;
	height: 25px;
	outline: none;
	font-size: 15px;
	font-family: 'Noto Sans KR';
}

.search-button {
	width: 180px;
	padding-top: 32px;
}

.search-button>input {
	width: 100%;
	height: 32px;
	font-size: 15px;
	color: white;
	background-color: #f49b00;
	outline: none;
	border: none;
	border-radius: 2px;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="../css/camp/campList.css" type="text/css" rel="stylesheet">

	<%-- <form action="/searchCampList.do" method="post">
		<input type="hidden" name="reqPage" value="1">
		<div class="search-wrap camp_search">
			<div class="search-check">
				<span><span style="color: white">What the </span>Keyword?</span>
				<select	name="keyword" id="checkIn">
				<c:choose>
					<c:when test="${keyword eq 'name' }">
						<option value="default">전체</option>
						<option value="name" selected>이름으로 검색</option>
						<option value="addr">주소로 검색</option>
					</c:when>
					<c:when test="${keyword eq 'addr' }">
						<option value="default">전체</option>
						<option value="name">이름으로 검색</option>
						<option value="addr" selected>주소로 검색</option>
					</c:when>
					<c:otherwise>
						<option value="default" selected>전체</option>
						<option value="name">이름으로 검색</option>
						<option value="addr">주소로 검색</option>
					</c:otherwise>
				</c:choose> 
				</select>
			</div>
			<div class="search-where">
				<span><span style="color: white">What do You</span> Want it?<span
					style="color: white"></span></span> 
					<c:choose>
						<c:when test="${value != null }">
							<input type="text" name="value"	placeholder="입력해주세요" value="${value }">
						</c:when>
						<c:otherwise>
							<input type="text" name="value"	placeholder="입력해주세요">
						</c:otherwise>
					</c:choose>				
			</div>
			<div class="search-button">
				<input type="submit" value="Search">
			</div>
		</div>
	</form> --%>
	<form action="/searchCampList.do" method="post">
	<div class="container">
		<div class="items-height">
			<div class="items-width">
				<div class="camp_search">
					<div class="input-group">					
						<input type="hidden" name="reqPage" value="1">
						<select name="keyword">
							<c:choose>
								<c:when test="${keyword eq 'name' }">							
									<option value="default">전체</option>
									<option value="name" selected>이름으로 검색</option>
									<option value="addr">주소로 검색</option>
								</c:when>
								<c:when test="${keyword eq 'addr' }">
									<option value="default">전체</option>
									<option value="name">이름으로 검색</option>
									<option value="addr" selected>주소로 검색</option>
								</c:when>
								<c:otherwise>
									<option value="default" selected>전체</option>
									<option value="name">이름으로 검색</option>
									<option value="addr">주소로 검색</option>
								</c:otherwise>
							</c:choose>
						</select> 
						<c:choose>
							<c:when test="${value != null }">
								<input type="text" name="value" class="form-control" placeholder="입력해주세요..." value="${value }">
							</c:when>
							<c:otherwise>
								<input type="text" name="value" class="form-control" placeholder="입력해주세요...">
							</c:otherwise>
						</c:choose>
						<div class="input-group-append">
							<button class="btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<c:choose>
		<c:when test="${list.size()>0 }">
			<div class="container">
				<div class="items-height">
					<br>
					<c:set var="size" value="${list.size() }" />
					<c:set var="end1" value="${size/5 }" />
					<c:if test="${size % 5 > 0}">
						<c:set var="end1" value="${end1+1 }" />
					</c:if>
					<c:set var="idx" value="0" />

					<c:forEach var="i" begin="1" end="${end1}">
						<c:choose>
							<c:when test="${size > 5}">
								<c:set var="end2" value="5" />
							</c:when>
							<c:otherwise>
								<c:set var="end2" value="${size }" />
								<c:set var="end3" value="${5-size }" />
							</c:otherwise>
						</c:choose>
						<c:set var="size" value="${size-5 }" />
						<div class="items-width">
							<c:forEach var="j" begin="1" end="${end2}">
								<c:set var="c" value="${list[idx] }" />
								<div class="item">
									<a href="/campView.do?campNo=${c.campNo }&reqPage=1">
										<div class="item-top">
											<div class="item-image">
												<img
													src="resources/upload/camp/${c.pictureList[0].filepath }">
												<c:choose>
													<c:when test="${c.siteList[0].lowDayPay > 0 }">
												최저 	${c.siteList[0].lowDayPay } ~
											</c:when>
													<c:otherwise>
												미등록
											</c:otherwise>
												</c:choose>

											</div>
										</div>
									</a>
									<div class="item-bottom">
										<div class="camp_name">${c.campName }</div>
										<div class="camp_addr">${c.campAddr }</div>
										<button class="btn btn-outline-dark btn-sm camp_button"
											onclick="location.href='/campView.do?campNo=${c.campNo}&reqPage=1'">상세보기</button>
									</div>
								</div>
								<c:set var="idx" value="${idx+1 }" />
							</c:forEach>
							<c:forEach var="j" begin="1" end="${end3}">
								<div class="item"></div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
			</div>
			<br>
			<div class="container">
				<div class="items-navi">
					<div class="btn-group">
						<c:if test="${list.size() > 5 }">
						${pageNavi }
					</c:if>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<h1>캠핑장이 존재하지 않습니다.</h1>
		</c:otherwise>
	</c:choose>
</body>
</html>