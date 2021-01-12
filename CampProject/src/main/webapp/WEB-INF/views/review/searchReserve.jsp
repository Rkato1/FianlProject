<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    	}

    	.res-table>tbody>tr>td:first-child {
        	width: 50px;
        	text-align: center;
    	}

    	.res-table>tbody>tr>td:last-child {
        	width: 350px;
        	height: 100px;
    	}

    	/*----------------------------------*/
    	
    	.selectBtn {
    		padding-top: 30px;
    	}

    	.selectBtn>button {
        	color: white;
        	background-color: black;
        	border: none;
        	outline: none;
        	width: 120px;
        	height: 40px;
        	border-radius: 5px;
    	}
    	
    	/*--------------------------------*/

        /*라디오, 체크박스 모양 변경*/
        input[type='radio']:after {
            width: 13px;
            height: 13px;
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

        input[type='radio']:checked:after {
            width: 13px;
            height: 13px;
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
	</style>

</head>
<body>

	<div class="table-wrap">
    	<table class="table res-table">
    		<c:forEach items="${listRes }" var="res">
        	<tr>
            	<td>
                	<input type="radio" value="${res.reserveNo }" name="select">
            	</td>
            	<td>
					<b>예약번호</b> &nbsp; ${res.reserveNo }<br>
					<b>캠핑장</b> &nbsp; ${res.campName }<br>
                   	<b>방문일자</b> &nbsp; ${res.checkInDate } ~ ${res.checkOutDate }
            	</td>
        	</tr>
        	</c:forEach>
        	<tr>
            	<td colspan="2" style="text-align: center;" class="selectBtn" id="selectBtn">
            		<button type="button" id="btn" onclick="closeWindow();">확인</button>
            	</td>
        	</tr>
    	</table>
    </div>

    <script>
    	function closeWindow() {
    		//아무것도 선택되지 않았을 때
    		if ($('input[name=select]:checked').length < 1) {
                alert('카테고리를 선택해주세요');
                //이벤트 버블링 제거
                event.stopPropagation();
            } else {
        		var searchNo = $("input[name=select]:checked").val();
        		  
        		//opener : 부모창의 문서 / document만 있으면 : 현재창 
        		var reserveNo = opener.document.getElementById("reserveNo");
        		var reviewContent = opener.document.getElementById("reviewContent");
        		
        		//input의 value값으로 예약번호 값 넣어주기
        		reserveNo.value = searchNo;
        		//내용 입력창으로 포커스 옮겨주기
        		reviewContent.focus();
        		//팝업창 닫기
        		self.close();
            }
    	}
    </script>


</body>
</html>