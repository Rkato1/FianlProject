<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<script src="/js/admin/admin.js"></script>
<body>
    <div class="admin-wrap">
        <!--화면 좌측-->
        <jsp:include page="sideMenu.jsp"/>        
        <!--화면 우측-->
        <div class="admin-content">
            <div class="real-content">
                <div class="members">
                    <p class="title">전체사용자정보</p>
                   
                    <table class="table table-hover">
                        <tr class="contentsLine">
                        	<th></th>
                            <th>번호</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>ID</th>
                            <th>PW</th>
                            <th>EMAIL</th>
                            <th>등록날짜</th>
                        </tr>                        
						<c:forEach items="${list }" var="m">
						<tr>
							<td><input type="radio" name="temp" class="change"></td>
							<td>${m.memberNo }</td>
                        	<td data-toggle="tooltip" data-placement="right" title="${m.memberName }">${m.memberName }</td>
                        	<td data-toggle="tooltip" data-placement="right" title="${m.memberPhone }">${m.memberPhone }</td>
                        	<td data-toggle="tooltip" data-placement="right" title="${m.memberId }">${m.memberId }</td>
                        	<td data-toggle="tooltip" data-placement="right" title="${m.memberPw }">${m.memberPw }</td>
                        	<td data-toggle="tooltip" data-placement="right" title="${m.memberEmail }">${m.memberEmail }</td>
                        	<td data-toggle="tooltip" data-placement="right" title="${m.memberRegDate }">${m.memberRegDate }</td>
                       	</tr>
                       	</c:forEach>
                       	<c:forEach items="${numList }" var="n">
                       		<input class="hiddenValue" type="hidden" value="${n}">
                       	</c:forEach>
                       	<tr>
                       		<td colspan="4"><button onclick="update()">수정하기</button></td>
                       		<td colspan="4"><button onclick="delete()">삭제하기</button></td>
                       	</tr>
                    </table>
                    <div id= "pageNavi">${pageNavi }</div>
                </div>
            </div>
        </div>
    </div>
    <div class="black_bg"></div>
	<div class="modal_wrap">
    	<div class="modal_close"><a href="" onclick="offModal()">close</a></div>
    	<div>
            <table class="updateTable">
            	<tr>
            		<td>번호</td>
            		<td><input type="text" name="memberNo" id="memberNo" value="" readonly></td>
            	</tr>
            	<tr>
                	<td>아이디</td>
                    <td><input type="text" name="memberId" id="memberId" value="" readonly></td>
          		</tr>
                <tr>
                	<td>비밀번호</td>
                	<td><input type="password" name="memberPw" id="memberPw" value=""></td>
                </tr>
                <tr>
                	<td>이메일</td>
                	<td><input type="text" name="memberEmail" id="memberEmail" value=""></td>
                </tr>
                <tr>
                	<td>이름</td>
                	<td><input type="text" name="memberName" id="memberName" value=""></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="memberPhone" id="memberPhone" value=""></td>
                </tr>
                <tr>
                	<td>가입일</td>
                	<td><input type="text" name="memberRegDate" id="memberRegDate" value="" readonly></td>
                </tr>
                <tr>
                	<td colspan="2" style="text-align: center;"><button type="button">수정하기</button></td>
                </tr>                
            </table>
    	</div>
	<div>

</body>
<script>
	function offModal(){
		var modal = $(".modal_wrap");
		var blcakbg = $(".black_bg");
		console.log(modal);
		console.log(blcakbg);
		modal.css('display','none');
		blcakbg.css('display','none');
	}
	function update(){
		var check = $("[type=radio]:checked");
		console.log(check);
		if(check != null){			
			var name = check.parent().next().next();
			console.log(name);
			var phone = name.next();
			console.log(phone);
			var id = phone.next();
			console.log(id);
			var pw = id.next();
			console.log(pw);
			var email = pw.next();
			console.log(email);
			var regdate = email.next();
			console.log(regdate);
			
			var pagingNo = check.parent().next().html();
			console.log(pagingNo);
			var memberNo = $(".hiddenValue");
			console.log(memberNo);
			var memNo = memberNo[pagingNo-1];
			console.log(memNo.value);
			$("#memberNo").val(memNo.value);
			$("#memberName").val(name.html());
			$("#memberNo").val(memNo.value);
			$("#memberNo").val(memNo.value);
			$("#memberNo").val(memNo.value);
			$("#memberNo").val(memNo.value);
			$("#memberNo").val(memNo.value);
			//console.log(memNo);
			//memNo.val(1);
			var modal = $(".modal_wrap");
			var blcakbg = $(".black_bg");
			//console.log(modal);
			//console.log(blcakbg);
			modal.css('display','block');
			blcakbg.css('display','block');
		}
	}	
</script>
</html>