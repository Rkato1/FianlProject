<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/campNoticeForm.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
        <div>
            <h2>공지사항 작성</h2>
            <hr>
            <form action="" method="get">
                <table border=1>
                	<input type="hidden" value="${ sessionScope.m.memberId}" name="campNoticeWriter">
                    <tr>
                        <th>제목</th>
                        <td style="width: 40%"><input type="text" name="campNoticeTitle" maxlength="30" style="height: 100%; width: 95%;"> </td>
                        <th>작성일</th>
                        <td style="width:20%"><span></span></td>
                    </tr>
                </table>
                <h3>내용</h3>
                <textarea name="campNoticeContent"></textarea>
                 <div style="height: 100px;text-align: center;"><input type="submit" value="등록완료"><button onclick="location.href='/opCampView.do?campNo=${camp.campNo}'">취소</button></div>
            </form>
        </div>
    </section>
</body>
</html>