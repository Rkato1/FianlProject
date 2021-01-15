<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
	 <div>
            <h2>공지사항 조회</h2>
            <hr>
            <div><a href="/opNoticeList.do?campNo=${camp.campNo}" style="text-decoration: none;">목록으로</a></div>
            <hr>
            <form>
                <table border=1>
                    <tr>
                        <th>제목</th>
                        <td style="width: 40%">${cNotice.campNoticeTitle } </td>
                        <th>작성일</th>
                        <td style="width:20%"><span>${cNotice.campNoticeDate }</span></td>
                    </tr>
                </table>
                <h3>내용</h3>
                <div>${cNotice.campNoticeContent }</div>
                <div style="height: 100px;text-align: center;"><button>수정하기</button></div>
            </form>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>