<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<div>
			<div>
				<h2>${camp.campName }</h2>
			</div>
			<hr>
			<div id="menu">
				<ul>
					<li>캠핑장정보</li>
					<ul>
						<a href=""><li
							style="border-bottom: 4px solid rgb(250, 220, 0);">캠핑장소개</li></a>
						<a href=""><li>이용 안내</li></a>
					</ul>
					<a href="#"><li>예약현황</li></a>
					<a href="#"><li>공지사항</li></a>
					<a href="#"><li>리뷰관리</li></a>
				</ul>
			</div>
			<div class="content">
				<table border=1 style="width: 51%;">
					<tr>
						<th></th>
						<th>평상시</th>
						<th>성수기</th>
					</tr>
					<tr>
						<th>주중</th>
						<td><span>${camp.campFeeOriDay }</span>원</td>
						<td><span>${camp.campFeePeakDay }</span>원</td>
					</tr>
					<tr>
						<th>주말</th>
						<td><span>${camp.campFeeOriEnd }</span>원</td>
						<td><span>${camp.campFeePeakEnd }</span>원</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>