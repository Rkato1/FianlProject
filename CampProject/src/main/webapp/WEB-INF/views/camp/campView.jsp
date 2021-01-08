<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>camp 상세보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="../css/camp/campView.css" type="text/css" rel="stylesheet">
	<%-- <h1>camp 상세보기</h1>
	<hr>
	<table border="1">
		<tr>
		 	<th>캠핑장번호</th><td>${camp.campNo }</td>
		</tr>
		<tr>
		 	<th>캠핑장이름</th><td>${camp.campName }</td>
		</tr>
		<tr>
		 	<th>캠핑장주소</th><td>${camp.campAddr }</td>
		</tr>
		<tr>
		 	<th>회원번호(사업자)</th><td>${camp.memberNo }</td>
		</tr>		
		<tr>
		 	<th>캠핑장소개글</th><td>${camp.campShow }</td>
		</tr>
		<tr>
		 	<th>캠핑장유형</th><td>${camp.campType }</td>
		</tr>
		<tr>
		 	<th>문의처</th><td>${camp.campPh }</td>
		</tr>
		<tr>
		 	<th>운영기간</th><td>${camp.campPeriod }</td>
		</tr>
		<tr>
		 	<th>운영일</th><td>${camp.campDay }</td>
		</tr>
		<tr>
		 	<th>이용가능시설</th><td>${camp.campFacility }</td>
		</tr>
		<tr>
		 	<th>평상시이용요금(주중)</th><td>${camp.campFeeOriDay }</td>
		</tr>
		<tr>
		 	<th>평상시이용요금(주말)</th><td>${camp.campFeeOriEnd }</td>
		</tr>
		<tr>
		 	<th>성수기이용요금(주중)</th><td>${camp.campFeePeakDay }</td>
		</tr>
		<tr>
		 	<th>성수기이용요금(주말)</th><td>${camp.campFeePeakEnd }</td>
		</tr>
	</table> --%>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>캠핑장 이미지</h4>
				<hr>
				<div id="demo" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="resources/upload/camp/camping_1.jpg" style="height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="resources/upload/camp/camping_2.jpg" style="height: 400px;">
						</div>
						<div class="carousel-item">
							<img src="resources/upload/camp/camping_3.jpg" style="height: 400px;">
						</div>
					</div>
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>달력 이미지</h4>
				<hr>
				<img src="resources/upload/camp/calender_01.jpg" style="width: 100%; height: 400px;">
			</div>
		</div>
	</div>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>캠핑장 배치도</h4>
				<hr>
				<img src="resources/upload/camp/layout_01.jpg" style="width: 100%; height: 400px;">
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>공지사항</h4>
				<hr>
				<div id="line-wrapper">
					<ul class="nav-menu">
						<li class="parent"><span>공지사항1</span>
							<button class="nav-chevron"></button>
							<ul>
								<li>123</li>
								<li>456</li>
							</ul></li>
						<li class="parent"><span>공지사항2</span>
							<button class="nav-chevron"></button>
							<ul>
								<li>123</li>
								<li>456</li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>예약정보</h4>
				<hr>
				<div id="line-wrapper">
					<ul class="nav-menu">
						<li class="parent"><span>예약정보1</span>
							<button class="nav-chevron"></button>
							<ul>
								<li>123</li>
								<li>456</li>
							</ul></li>
						<li class="parent"><span>예약정보2</span>
							<button class="nav-chevron"></button>
							<ul>
								<li>123</li>
								<li>456</li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>오시는 길</h4>
				<hr>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$(".nav-chevron").next().hide();
		});
		$('.nav-chevron').click(function() {
			$(this).next().toggle(400);
			$(this).toggleClass('transform');
		})
	</script>
</body>
</html>