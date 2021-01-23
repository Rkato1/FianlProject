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
                       		<td colspan="4"><button onclick="deleteMan()">삭제하기</button></td>
                       	</tr>
                    </table>
                    <div id= "pageNavi">${pageNavi }</div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	function deleteMan(){
		var check = $("[type=radio]:checked");
		console.log(check);
		if(check != null){
			var pagingNo = check.parent().next().html();
			console.log(pagingNo);
			var memberNo = $(".hiddenValue");
			console.log(memberNo);
			var memNo = memberNo.eq(pagingNo-1);
			console.log(memNo.val());
			if(memNo.val() != null){
				location.href="/admin/realDelete.do?memberNo="+memNo.val();
			}
		}
	}
	function update(){
		var check = $("[type=radio]:checked");
		console.log(check);
		if(check != null){
			var pagingNo = check.parent().next().html();
			console.log(pagingNo);
			var memberNo = $(".hiddenValue");
			console.log(memberNo);
			var memNo = memberNo.eq(pagingNo-1);
			console.log(memNo.val());
			var memId = check.parent().next().next().next().next().html();
			console.log(memId);
			if(memNo.val() != null && memId != null){
				location.href="/mypage.do?memberNo="+memNo.val()+"&memberId="+memId;
			}
		}
	}
</script>
</html>