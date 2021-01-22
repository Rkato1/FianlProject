<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAC : 사업자 페이지 캠핑장 공지사항 등록</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opNoticeView.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opNoticeForm.css" type="text/css" rel="stylesheet">
<link href="../css/operator/btn.css" type="text/css" rel="stylesheet">
<script src = "/js/ckeditor/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
        <div>
            <h2>공지사항 작성</h2>
            <hr>
            <div><a href="/opNoticeList.do?campNo=${campNo}&reqPage=1" style="text-decoration: none;">목록으로</a></div>
            <hr>
            <form action="/insertCampNotice.do" method="get" style="width: 100%;">
                <table class="table">
                	<input type="hidden" value="${sessionScope.m.memberId}" name="campNoticeWriter">
                	<input type="hidden" value="${campNo}" name="campNo">
                    <tr>
                        <th>제목</th>
                        <td style="width: 100%"><input type="text" name="campNoticeTitle" maxlength="30" style="height: 100%; width: 95%;border : 1px solid #ccc;"> </td>
                    </tr>
                     <tr>
                    	<th>내용</th>
                    	<td colspan="3">
                    		<div style="width:100% ;"><textarea name="campNoticeContent" id="ckeditor" style="resize:none" required="required" ></textarea></div>
                    		<script>CKEDITOR.replace('ckeditor');</script>
                    	</td>
                    </tr>
                </table>
                 <div div class="btn-div">
                	<input class="btn-submit" type="submit" value="등록완료">
                 	<button class="btn-cancel" type="button" onclick="location.href='opNoticeList.do?campNo=${campNo}&reqPage=1'">취소</button>
                 </div>
            </form>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
    $("[type=submit]").click(function(){
    	if($("[name=campNoticeTitle]").val()==''){
    		alert("제목을 입력하세요!");
    		return false;
    	}
    	$("[name=campNoticeContent]").html(CKEDITOR.instances.ckeditor.getData());
    	if($("[name=campNoticeContent]").val()==''){
    		alert("내용을 입력하세요!");
    		return false;
    	}
    });
    </script>
</body>
</html>