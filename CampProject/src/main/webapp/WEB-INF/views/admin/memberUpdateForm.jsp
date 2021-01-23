<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
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
                    <p class="title">회원 정보 수정</p>
                   	
                    <form action="/updateMember.do" method="post">
			            <input type="hidden" name="memberNo" id="memberNo" value="${m.memberNo }">
			            <table class="mypage-table">
			            	<tr>
			                	<td>아이디</td>
			                    <td>
			                        <input type="text" name="memberId" id="memberId" class="mypage-input" value="${m.memberId }" readonly>
			                    </td>
			          		</tr>
			                <tr>
			                	<td>비밀번호</td>
			                	<td>
			                		<input type="password" name="memberPw" id="memberPw" class="mypage-input" value="" readonly>
			                		<button type="button" id="changePw" onclick="change();">비밀번호 변경</button>
			                	</td>
			                </tr>
			                <tr>
			                	<td>이메일</td>
			                	<td>
			                		<input type="text" name="memberEmail" id="memberEmail" class="mypage-input" value="${m.memberEmail }">
									<span id="emailSpan"></span>
								</td>
			                </tr>
			                <tr>
			                	<td>이름</td>
			                	<td>
			                		<input type="text" name="memberName" id="memberName" class="mypage-input" value="${m.memberName }" readonly>
			                	</td>
			                </tr>
			                <tr>
			                    <td>휴대폰</td>
			                    <td>
			                    	<input type="text" name="memberPhone" id="memberPhone" class="mypage-input" value="${m.memberPhone }">
			                    	<span id="phoneSpan"></span>
			                    </td>
			                </tr>
			                <tr>
			                	<td>가입일</td>
			                	<td>
			                		<input type="text" name="memberRegDate" id="memberRegDate" class="mypage-input" value="${m.memberRegDate }" readonly>
			                	</td>
			                </tr>
			                <tr>
			                	<td colspan="2" style="text-align: center;" class="update-btn-td">
			                		<input type="submit" id="updateBtn" value="수정하기">
			                	</td>
			                </tr>
			                <tr>
			                	<td colspan="2" style="text-align: center;">
			                		<span class="delete"><span>정말로 탈퇴하시겠어요?&nbsp;</span>
			                		<a href="javascript:void(0)" onclick="deleteMember(${m.memberNo })">회원탈퇴</a>
			                		</span>
			                	</td>
			                </tr>
			            </table>
		            </form>
                </div>
            </div>
        </div>

    </div> 
</body>
<script>
	function update(){
		var check = $("[type=radio]:checked");
		console.log(check);
		if(check != null){
			var pagingNo = check.parent().next().html();
			console.log(pagingNo);
			var memberNo = $(".hiddenValue");
			console.log(memberNo);
		}
	}
</script>
</html>