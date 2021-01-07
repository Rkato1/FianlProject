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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="../css/camp/campList.css" type="text/css" rel="stylesheet">
	<div class="container">
		<div class="items-height">
			<div class="camp_search">
				<div class="input-group">
					<select>
						<option value="default" selected>--선택--</option>
						<option value="name">이름으로 검색</option>
						<option value="addr">주소로 검색</option>
					</select> <input type="text" class="form-control" placeholder="입력해주세요...">
					<div class="input-group-append">
						<button class="btn" type="button">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
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
							<a href="/campView.do?campNo=${c.campNo }">
								<div class="item-top">
									<div class="item-image">
										<img src="resources/upload/camp/camp_1.jpg"> 최저
										${c.campFeeOriDay } ~
									</div>
								</div>
							</a>
							<div class="item-bottom">
								<div class="camp_name">${c.campName }</div>
								<div class="camp_addr">${c.campAddr }</div>
								<button class="btn btn-outline-primary camp_button"
									onclick="location.href='/campView.do?campNo=${c.campNo}'">상세보기</button>
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
			<div class="btn-group">${pageNavi }</div>
		</div>
	</div>
</body>
</html>