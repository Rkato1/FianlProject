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
            <h2>공지사항 작성</h2>
            <hr>
            <div><a href="/opNoticeList.do?campNo=${campNo}&reqPage=1" style="text-decoration: none;">목록으로</a></div>
            <hr>
            <form action="/insertCampNotice.do" method="get">
                <table class="table">
                	<input type="hidden" value="${ sessionScope.m.memberId}" name="campNoticeWriter">
                	<input type="hidden" value="${campNo}" name="campNo">
                    <tr>
                        <th>제목</th>
                        <td style="width: 100%"><input type="text" name="campNoticeTitle" maxlength="30" style="height: 100%; width: 95%;"> </td>
                    </tr>
                     <tr>
                    	<th>내용</th>
                    	<td colspan="3">
                    		<div style="width:100% ;height:200px;"><textarea name="campNoticeContent" onKeyUp="javascript:fnChkByte(this,'2100')"></textarea></div>
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
    <script>
    function fnChkByte(obj, maxByte){
        var str = obj.value;
        var str_len = str.length;
        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";
        for(var i=0; i<str_len; i++){
            one_char = str.charAt(i);
            if(escape(one_char).length > 4){
                rbyte += 2;                                         //한글2Byte
            }
            else{
                rbyte++;                                            //영문 등 나머지 1Byte
            }
            if(rbyte <= maxByte){
                rlen = i+1;                                          //return할 문자열 갯수
            }
         }
         if(rbyte > maxByte){
		      // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
		      alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
		      str2 = str.substr(0,rlen);                                  //문자열 자르기
		      obj.value = str2;
		      fnChkByte(obj, maxByte);
         }
         else{
            document.getElementById('byteInfo').innerText = rbyte;
         }
    }
    </script>
</body>
</html>