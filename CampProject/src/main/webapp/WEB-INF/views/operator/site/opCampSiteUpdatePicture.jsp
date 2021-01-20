<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/opCampForm.css" type="text/css" rel="stylesheet">
<link href="../css/operator/btn.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp"/>
	<section>
        <div class="content" style="margin:0 auto">
            <div style="margin:0 auto">
	             <h4>시설 배치도 수정</h4>
	             <hr>
	             <h6>배치도로 사용할 사진을 선택해 주세요.</h6>
	             <form action="/updateInfoImg.do" method="post" enctype="multipart/form-data">
	             <input type="hidden" name="campNo" value="${camp.campNo }">
	                <table class="table">
	                	<tr>
	                		<td><input type="file" name="file"></td>
	                	</tr>

	                </table>
	                <div class="btn-wrapper">
	                	<input type="submit" class="btn-update" value="등록">
	                	<button type="button" class="btn-cancel" onclick="back()">취소</button>
	                </div>
	             </form>  
             </div>	
        </div>
    </section>    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
	$("[type=submit]").click(function(){
		if($("[name=file]").val()==""){
			alert("이미지를 선택해주세요.");
			return false;
		}
	});
	$("[name=file]").change(function(){
		chk_file_type($(this));
	});
	function chk_file_type(obj) {
		 var ext = $(obj).val().split('.').pop().toLowerCase();
		    if ($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		        alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
		        $("[name=file]").val("");
		        return;
		    }
		}
	function back(){
		location.href='/opCampSite.do?campNo=${camp.campNo}';
	}
    </script>
</body>
</html>