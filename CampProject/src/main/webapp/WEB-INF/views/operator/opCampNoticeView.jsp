<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/opNoticeView.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
		<div>
            <h2>공지사항 조회</h2>
            <hr>
            <div><a href="/opNoticeList.do?campNo=${cNotice.campNo}&reqPage=1" style="text-decoration: none;">목록으로</a></div>
            <hr>
            <form>
                <table class="table">
                    <tr>
                    	<input type="hidden" name="campNoticeWriter" value="${cNotice.campNoticeWriter }">
                        <th>제목</th>
                        <td style="width: 40%">${cNotice.campNoticeTitle } </td>
                        <th>작성일</th>
                        <td style="width:20%"><span>${cNotice.campNoticeDate }</span></td>
                    </tr>
                    <tr>
                    	<th>내용</th>
                    	<td colspan="3">
                    		<div style="width:100% ;height:200px;white-space:pre;">${cNotice.campNoticeContent }</div>
                    	</td>
                    </tr>
                </table>
             </form>
                <div class="btn-div">
                	<c:if test="${sessionScope.m.memberId eq cNotice.campNoticeWriter }">
	                	<button class="btn-update" onclick="location.href='/campNoticeUpdateForm.do?campNoticeNo=${cNotice.campNoticeNo}&campNo=${cNotice.campNo}'">수정</button>
	                	<button class="btn-delete" onclick="location.href='/deleteCampNotice.do?campNoticeNo=${cNotice.campNoticeNo}&campNo=${cNotice.campNo}'">삭제</button>
                	</c:if>
                </div>
        </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>