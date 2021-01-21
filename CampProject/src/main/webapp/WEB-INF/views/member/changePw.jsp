<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

	<style>
	
    	* {
        	font-family: 'Noto Sans KR';
    	}
    	
    	.table-wrap {
    		margin: 50px;
    		text-align: center;
    	}
    	
    	/*----------------------------------*/
    	
    	.pw-table {
    		border-collapse: collapse
    	}
    	
    	.pw-table>tbody>tr>td:first-child {
        	width: 130px;
        	text-align: left;
    	}
    	.pw-table>tbody>tr>td:last-child {
        	width: 250px;
        	height: 40px;
        	text-align: left;
    	}
    	
    	.pw-input {
    		width: 250px;
    		height: 25px;
    		outline: none;
    		border: 1px solid #d3d3d3;
            border-radius: 5px;
    	}
    	
    	#text {
    		font-size: 11px;
    	}
    	
    	/*----------------------------------*/
    	
    	.button-box {
    		padding-top: 30px;
    	}
    	
    	.selectBtn {
        	color: white;
        	background-color: black;
        	border: none;
        	outline: none;
        	width: 120px;
        	height: 40px;
        	border-radius: 5px;
    	}
    	
	</style>
</head>

<body>
	<div class="table-wrap">
	    <form action="/updateMemberPw.do" method="post" name="updateMemberPw">
		<table class="table pw-table">
			<tr>
				<td>기존 비밀번호</td>
				<td>
					<input type="hidden" name="memberNo" id="memberNo" value="${memberNo }">				
					<input type="password" name="memberPw_old" id="memberPw_old" class="pw-input" placeholder="비밀번호를 입력해주세요"> <span id="text"></span>
				</td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td>
					<input type="password" name="memberPw" id="memberPw" class="pw-input" placeholder="새로운 비밀번호를 입력해주세요"> <span id="text"></span>
				</td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>		
				<td>
					<input type="password" name="memberPw_re" id="memberPw_re" class="pw-input" placeholder="비밀번호를 한번 더 입력해주세요"> <span id="text"></span>
				</td>
			</tr>
			<tr>
            	<td colspan="2" style="text-align: center;" class="button-box">
            		<button type="button" class="selectBtn" id="selectBtn">확인</button>
            	</td>
        	</tr>
		</table>
		</form>
	</div>
	
	<script>
        $(function() {
            //입력양식 확인 check배열 생성
            var check = [false, false, false];
                      
            //기존 비밀번호 확인 
            $("#memberPw_old").change(function() {
            	var memberNo = $("#memberNo").val();
                var memberPw = $("#memberPw_old").val();
				$.ajax({
					url: "/pwCheck.do",
					type: "get",
					data: {
						memberNo: memberNo,
						memberPw: memberPw
					},
					success: function(data) {
						if (data == 0) { //기존의 비밀번호와 일치
							$("span").eq(0).text("");
							$("#memberPw_old").css('border', '2px solid #1d0e0e');
							check[0] = true;                            
						} else { //기존 비밀번호와 불일치
							$("span").eq(0).text("비밀번호를 확인해주세요");
							$("span").eq(0).css('color', 'red');
							$("#memberPw_old").css('border', '2px solid red');
							check[0] = false;
						}
					},
					error: function(data) {
						alert("데이터 전송 오류");
					}
				});
            });
            
            //새 비밀번호
            $("#memberPw").change(function() {            	
            	check[2] = false;
            	var memberPwOld = $("#memberPw_old").val();
            	var memberPw = $("#memberPw").val();            	
            	//기존 비밀번호와 새 비밀번호가 같을 때
            	if(memberPwOld == memberPw) {
            		check[1] = false;
                    $("span").eq(1).text("기존 비밀번호와 동일한 비밀번호는 사용할 수 없습니다");
                    $("span").eq(1).css('color', 'red');
                    $("#memberPw").css('border', '2px solid red');
            	} else {
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
            	}
            });
            
            //비밀번호 재입력
            $("#memberPw_re").change(function() {
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
                              
            //Submit 버튼
            $("#selectBtn").click(function(event) {
            	var regChk = 0;
                for (var i = 0; i < check.length; i++) {
					if (check[i] == true) {
						regChk++;
					}
				}
				if (regChk < 3) {
					alert("입력한 정보를 확인해주세요.");
                    event.preventDefault();
				} else {
                    
	            	var memberNo = $("#memberNo").val();
	                var memberPw = $("#memberPw").val();
					
					$.ajax({
                        url: "/updateMemberPw.do",
                        type: "get",
                        data: {
    						memberNo: memberNo,
    						memberPw: memberPw
                        },
                        success: function(data) {
                            if (data == 0) { //비밀번호 변경 성공
                            	alert("비밀번호가 변경되었습니다.");
                            } else { //비밀번호 변경 실패
                            	alert("※에러※ 관리자에게 문의해주세요");
                            }
                            self.close();
                        },
                        error: function(data) {
                            alert("데이터 전송 오류");
                        }
                    });	        		
				}                
            });
        });
    </script>	
	
										
</body>
</html>