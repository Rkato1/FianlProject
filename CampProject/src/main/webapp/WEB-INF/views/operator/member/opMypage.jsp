<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/opMypage.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp"/>
	<section style="width:80%; margin: 0 auto">
	<div class="content" style="width:80%; margin: 0 auto">
        <div class="mypage-header">
            <p class="mypage-title">MYPAGE</p>
        </div>

        <div class="mypage-table" id="info">
            <form action="/opUpdateMember.do" method="post">
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
                            <input type="password" name="memberPw" id="memberPw" class="mypage-input" value="" placeholder="비밀번호를 입력해주세요">
                        	<span id="pwSpan"></span>
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
                            <input type="submit" id="updateBtn" value="수정하기" style="width: 100px;">
                            <button type="button" style="width: 100px; height: 50px;border-radius: 5px;outline: none; border: none; background-color: #ccc;color: white;font-size: 1em;" onclick="location.href='/operatorpage.do'">취소</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <span class="delete">정말로 탈퇴하시겠어요? <a href="javascript:void(0)" onclick="deleteMember(${m.memberNo })">회원탈퇴</a></span>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
        $(function() {
            //입력양식 확인 check배열 생성
            var check = [false, false, false];
            
            //비밀번호 확인
            $("#memberPw").change(function() {
                var reg = /^[A-Za-z0-9]{6,18}$/;
                if (reg.test($(this).val())) {
                	check[0] = true;
                    $("#pwSpan").text("");
                    $("#memberPw").css('border', '2px solid #1d0e0e');
                } else {
                	check[0] = false;
                    $("#pwSpan").text("6~18자리 영어 대소문자/숫자 조합");
                    $("#pwSpan").css('color', 'red');
                    $("#memberPw").css('border', '2px solid red');
                }
            });
            
            //이메일 확인
            $("#memberEmail").change(function() {
                var reg = /^[a-z][a-z0-9_-]{3,12}@([a-z\d\.]+)\.([a-z]{2,6})$/;
                if (reg.test($(this).val())) {
                    check[1] = true;
                    $("#emailSpan").text("");
                    $("#memberEmail").css('border', '2px solid #1d0e0e');
                } else {
                    check[1] = false;
                    $("#emailSpan").text("입력예시) createacamp@email.com");
                    $("#emailSpan").css('color', 'red');
                    $("#memberEmail").css('border', '2px solid red');
                }
            });
            
            //휴대폰 확인
            $("#memberPhone").change(function() {
                var reg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
                if (reg.test($(this).val())) {
                    check[2] = true;
                    $("#phoneSpan").text("");
                    $("#memberPhone").css('border', '2px solid #1d0e0e');
                } else {
                    check[2] = false;
                    $("#phoneSpan").text("입력예시) 010-1234-5678");
                    $("#phoneSpan").css('color', 'red');
                    $("#memberPhone").css('border', '2px solid red');
                }
            });
            
            //Submit 버튼
            $("#updateBtn").click(function(event) {
                var regChk = 0;
                for (var i = 0; i < check.length; i++) {
                    if (check[i] == true) {
                        regChk++;
                    }
                }
                
            	if (regChk < 3) {
                    alert("입력한 정보를 확인해주세요.");
                    event.preventDefault();
                } 
            });
        });

        
    	//회원 탈퇴 버튼 클릭 했을 때
    	function deleteMember(memberNo) {
    		if(confirm("탈퇴 후에는 회원 정보를 복구할 수 없습니다. 정말 탈퇴하시겠어요?")) {
    			location.href="/deleteMember.do?memberNo="+memberNo;
    		}
    	}
    </script>
</body>
</html>