<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="table res-table">
		<tr>
			<td>기존 비밀번호</td>
			<td><input type="text" name="memberId" id="memberId"
				class="join-input" placeholder="사용하시는 비밀번호를 입력해주세요"> <span></span>
			</td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td><input type="password" name="memberPw" id="memberPw"
				class="join-input" placeholder="비밀번호를 입력해주세요"> <span></span>
			</td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td><input type="password" name="memberPw_re" id="memberPw_re"
				class="join-input" placeholder="비밀번호를 한번 더 입력해주세요"> <span></span>
			</td>
		</tr>
	</table>

</body>
</html>