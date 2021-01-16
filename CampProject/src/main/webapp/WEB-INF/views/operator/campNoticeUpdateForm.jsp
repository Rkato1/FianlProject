<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opNoticeView.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opNoticeForm.css" type="text/css" rel="stylesheet">
<link href="../css/operator/btn.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
        <div>
            <h2>공지사항 수정</h2>
            <hr>
            <form action="/updateCampNotice.do" method="get">
                <table class="table">
                	<input type="hidden" value="${ sessionScope.m.memberId}" name="campNoticeWriter">
                	<input type="hidden" value="${cNotice.campNo}" name="campNo">
                	<input type="hidden" value="${cNotice.campNoticeNo}" name="campNoticeNo">
                    <tr>
                        <th>제목</th>
                        <td style="width: 100%"><input type="text" name="campNoticeTitle" maxlength="30" style="height: 100%; width: 95%;" value="${cNotice.campNoticeTitle }"></td>
                    </tr>
                     <tr>
                    	<th>내용</th>
                    	<td colspan="3">
                    		<div style="width:100% ;height:200px;"><textarea name="campNoticeContent" onKeyUp="javascript:fnChkByte(this,'2100')">${cNotice.campNoticeContent }</textarea></div>
                    	</td>
                    </tr>
                </table>
                 <div div class="btn-div">
                	<input class="btn-submit" type="submit" value="수정완료">
                 	<button class="btn-cancel" type="button" onclick="location.href='opNoticeList.do?campNo=${cNotice.campNo}&reqPage=1'">취소</button>
                 </div>
            </form>
        </div>
    </section>
</body>
</html>