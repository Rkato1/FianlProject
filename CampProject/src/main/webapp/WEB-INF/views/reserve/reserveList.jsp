<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약리스트</title>
</head>
<body>
	<h1>예약리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<th>예약번호</th><th>회원번호</th><th>캠핑장번호</th><th>입실일</th><th>퇴실일</th><th>예약상태</th><th>예약장소</th>
			<th>결제금액</th><th>예약비밀번호</th><th>차량번호</th><th>예약메모</th>
		</tr>
		<c:forEach items="${list }" var="r">
			<tr>
				<td>${r.reserveNo }</td>
				<td>${r.memberNo }</td>
				<td>${r.campNo }</td>
				<td>${r.checkInDate }</td>
				<td>${r.checkOutDate }</td>
				<td>${r.reserveStatus }</td>
				<td>${r.reservePlace }</td>
				<td>${r.reservePrice }</td>
				<td>${r.reservePw }</td>
				<td>${r.carNumber }</td>
				<td>${r.reserveMeno }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/">메인으로 돌아가기</a>
</body>
</html>