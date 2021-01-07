<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Google Fonts -->
<html lang="kr">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        * {
            font-family: 'Noto Sans KR';
        }

        .content-wrap {
            width: 800px;
            margin: 0 auto;
            padding-top: 50px;
            padding-bottom: 80px;
            background-color: white;
        }

        .join-header {
            height: 90px;
            line-height: 90px;
        }

        .join-title {
            padding: 0;
            margin: 0;
            text-align: center;
            font-weight: bolder;
        }

        /*--------------------------------*/

        .join-table {
            margin: 0 auto;
            box-sizing: border-box;
        }

        /*표 첫번째 열*/
        .join-table>tbody>tr>td:first-child {
            width: 170px;
            height: 50px;
            font-size: 17px;
        }

        /*표 두번째 열*/
        .join-table>tbody>tr>td:last-child {
            width: 300px;
        }

        /*input 태그*/
        .join-input {
            width: 100%;
            height: 38px;
            outline: none;
            border: 1px solid #cccccc;
            border-radius: 5px;
            padding-left: 10px;
        }

        /*입력 양식 틀렸을 때 나타나는 span태그*/
        .join-table>tbody>tr>td>span {
            font-size: 15px;
            font-weight: 400;
        }
        
        /*--------------------------------*/

        /*이용약관 표 내부*/
        .checkbox-td {
            font-size: 15px;
            height: 250px;
        }
        
        .checkbox-td>span {
            color: #a0a0a0;
        }

        #agreeAll+label {
            font-weight: bold;
            font-size: 1.2em;
        }
        
        .checkbox-td>lable {
        	margin: 0;
        }
        
        /*--------------------------------*/

        /*라디오, 체크박스 모양 변경*/
        input[type='radio']:after,
        input[type='checkbox']:after {
            width: 18px;
            height: 18px;
            border-radius: 5px;
            top: -3px;
            left: -2px;
            position: relative;
            background-color: #ffffff;
            content: '';
            display: inline-block;
            visibility: visible;
            border: 2px solid #383a3f;
        }

        input[type='radio']:checked:after,
        input[type='checkbox']:checked:after {
            width: 18px;
            height: 18px;
            border-radius: 5px;
            top: -3px;
            left: -2px;
            position: relative;
            background-color: #f49b00;
            content: '';
            display: inline-block;
            visibility: visible;
            border: 2px solid #383a3f;
        }

         /*--------------------------------*/

		.btn-td {
			text-align: center;
			padding-top: 40px;
		}
		
        /*가입하기 버튼*/
        button[type='submit'] {
            width: 280px;
            height: 50px;
            border-radius: 5px;
            outline: none;
            border: none;
            background-color: #383a3f;
            color: white;
            font-size: 1em;
        }

    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div class="content-wrap">
        <div class="join-header">
            <h1 class="join-title">회원가입</h1>
        </div>
        <form action="/join.do" method="post">
            <table class="join-table">
                <tr>
                    <td colspan="2" style="text-align: center; padding: 35px;">
                        <input type="radio" name="memberGrade" value="1" checked>&nbsp;&nbsp;&nbsp;캠핑러(회원)&emsp;&emsp;
                        <input type="radio" name="memberGrade" value="2">&nbsp;&nbsp;&nbsp;캠핑지기(사업자)
                    </td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="memberId" id="memberId" class="join-input" placeholder="6자리 이상의 소문자와 숫자 조합">
                        <span></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="memberPw" id="memberPw" class="join-input" placeholder="비밀번호를 입력해주세요">
                        <span></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" name="memberPw_re" id="memberPw_re" class="join-input" placeholder="비밀번호를 한번 더 입력해주세요">
                        <span></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="text" name="memberEmail" id="memberEmail" class="join-input" placeholder="예) createacamp@email.com">
                        <span></span>
                    </td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="memberName" id="memberName" class="join-input" placeholder="이름을 입력해주세요">
                        <span></span>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                        <input type="text" name="memberPhone" id="memberPhone" class="join-input" placeholder="예) 010-1234-5678">
                        <span></span>
                    </td>
                </tr>
                <tr>
                   <td>이용약관</td>
                    <td class="checkbox-td">
                        <input type="checkbox" id="agreeAll">
                        <label for="allAgree">&nbsp;전체 이용 약관 동의</label><br><br>
                        <input type="checkbox" class="agrees" id="agree1">
                        <label for="agree1">&nbsp;<span style="color: #f49b00">(필수)</span> 이용약관에 동의합니다.</label><br>
                        <input type="checkbox" class="agrees" id="agree2">
                        <label for="agree2">&nbsp;<span style="color: #f49b00">(필수)</span> 개인정보처리방침에 동의합니다.</label><br><br>
                        <input type="checkbox" class="agrees" id="agree3">
                        <label for="agree3">&nbsp;(선택) 광고성 정보 수신 동의</label><br>
                        <span>회원에게 제공되는 더 많은 정보를 받아보세요!</span><br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="btn-td">
                        <button type="submit" id="joinBtn">가입하기</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
  	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
        $(function() {
            //입력양식 확인 check배열 생성
            var check = [false, false, false, false, false];

            //아이디 확인 및 중복체크
            $("#memberId").change(function() {
                var memberId = $(this).val();
                var reg = /^[a-z][a-z0-9_-]{5,12}$/;
                if (reg.test(memberId)) {
                    check[0] = true;
                    $("span").eq(0).text("");
                    $("#memberId").css('border', '2px solid #1d0e0e');
                } else {
                    check[0] = false;
                    $("span").eq(0).text("입력한 정보를 확인해주세요");
                    $("span").eq(0).css('color', 'red');
                    $("#memberId").css('border', '2px solid red');
                }
                if (check[0]) {
                    $.ajax({
                        url: "/idCheck.do",
                        type: "get",
                        data: {
                            memberId: memberId
                        },
                        success: function(data) {
                            var msg = $("#idchkMsg");
                            if (data == 0) { //중복 회원 없음
                                $("#memberId").css('border', '2px solid #1d0e0e');
                            } else { //중복 회원 있음
                                $("span").eq(0).text("증복된 아이디 입니다.");
                                $("span").eq(0).css('color', 'red');
                                $("#memberId").css('border', '2px solid red');
                                check[0] = false;
                            }
                        },
                        error: function(data) {
                            alert("ajax 오류");
                        }
                    });
                }

            });
            
            //비밀번호 확인
            $("#memberPw").change(function() {
                var reg = /^[A-Za-z0-9_-]{6,18}$/;
                if (reg.test($(this).val())) {
                    check[1] = true;
                    $("span").eq(1).text("");
                    $("#memberPw").css('border', '2px solid #1d0e0e');
                } else {
                    check[1] = false;
                    $("span").eq(1).text("6~18자리 영어 대소문자/숫자 조합");
                    $("span").eq(1).css('color', 'red');
                    $("#memberPw").css('border', '2px solid red');
                }
            });
            
            //비밀번호 재입력
            $("#memberPw_re").change(function() {
                var reg = /^[A-Za-z0-9_-]{6,18}$/;
                if ($("#memberPw").val() != "") {
                    if ($(this).val() == $("#memberPw").val()) {
                        check[2] = true;
                        $("span").eq(2).text("");
                        $("#memberPw_re").css('border', '2px solid #1d0e0e');
                    } else {
                        check[2] = false;
                        $("span").eq(2).text("동일한 비밀번호를 입력해주세요");
                        $("span").eq(2).css('color', 'red');
                        $("#memberPw_re").css('border', '2px solid red');
                    }
                }
            });
            
            //이메일 확인
            $("#memberEmail").change(function() {
                var reg = /^[a-z][a-z0-9_-]{3,12}@([a-z\d\.]+)\.([a-z]{2,6})$/;
                if (reg.test($(this).val())) {
                    check[3] = true;
                    $("span").eq(3).text("");
                    $("#memberEmail").css('border', '2px solid #1d0e0e');
                } else {
                    check[3] = false;
                    $("span").eq(3).text("입력한 정보를 확인해주세요");
                    $("span").eq(3).css('color', 'red');
                    $("#memberEmail").css('border', '2px solid red');
                }
            });
            
            //이름 확인
            $("#memberName").change(function() {
                var reg = /^[가-힣]{2,6}$/;
                if (reg.test($(this).val())) {
                    check[4] = true;
                    $("span").eq(4).text("");
                    $("#memberName").css('border', '2px solid #1d0e0e');
                } else {
                    check[4] = false;
                    $("span").eq(4).text("입력한 정보를 확인해주세요");
                    $("span").eq(4).css('color', 'red');
                    $("#memberName").css('border', '2px solid red');
                }
            });
            
            //휴대폰 확인
            $("#memberPhone").change(function() {
                var reg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
                if (reg.test($(this).val())) {
                    check[5] = true;
                    $("span").eq(5).text("");
                    $("#memberPhone").css('border', '2px solid #1d0e0e');
                } else {
                    check[5] = false;
                    $("span").eq(5).text("입력한 정보를 확인해주세요");
                    $("span").eq(5).css('color', 'red');
                    $("#memberPhone").css('border', '2px solid red');
                }
            });
            
            
            //이용약관 전체체크 가져오기
            var agreeAll = $("#agreeAll");
            //체크박스 나머지 클래스로 가져오기
            var agrees = $(".agrees");
            

            agreeAll.click(function() {

                if (agreeAll.prop("checked")) {
                    //each()메소드 : for반복문 사용
                    agrees.each(function(index, item) {
                        $(item).prop("checked", true)
                    });
                } else {
                    agrees.each(function(index, item) {
                        $(item).prop("checked", false)
                    });
                }

            });
            
            
            //Submit 버튼
            $("#joinBtn").click(function(event) {
                if ($("#agree1").is(":checked") && $("#agree2").is(":checked")) {
                    var regChk = 0;
                    for (var i = 0; i < check.length; i++) {
                        if (check[i] == true) {
                            regChk++;
                        }
                    }
                    if (regChk < 5) {
                        alert("입력한 정보를 확인해주세요.");
                        event.preventDefault();
                    }
                } else {
                    alert("필수 약관에 동의해주세요.");
                    event.preventDefault();
                }
            });
        });

    </script>
</body>
</html>