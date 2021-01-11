<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    	.rev-table>tbody>tr>td:first-child {
        	width: 40px;
        	text-align: center;
    	}

    	.rev-table>tbody>tr>td:last-child {
        	width: 350px;
        	height: 80px;
    	}

    	/*----------------------------------*/

    	.selectBtn>button {
        	color: white;
        	background-color: black;
        	border: none;
        	outline: none;
        	width: 100px;
        	height: 30px;
        	border-radius: 5px;
    	}
	</style>

</head>
<body>

    <table class="rev-table">
        <tr>
            <td>
                <input type="radio" name="select" value="15684354321">
            </td>
            <td>
                <label for="select">
                    예약번호 : 15684354321<br>
                    캠핑장 : 어쩌구 캠핑장<br>
                    방문일자 : 2020-12-30 ~ 2020-12-31
                </label>
            </td>
        </tr>
        <tr>
            <td>
                <input type="radio" name="select" value="98452157">
            </td>
            <td>
                <label for="select">
                    예약번호 : 98452157<br>
                    캠핑장 : 저쩌구 캠핑장<br>
                    방문일자 : 2020-12-30 ~ 2020-12-31
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;" class="selectBtn" id="selectBtn"><button type="button" id="btn">확인</button></td>
        </tr>
    </table>

    <script>
        $('#selectBtn').click(function() {
            if ($('input[name=select]:checked').length < 1) {
                alert('카테고리를 선택해주세요');
            } else {
                console.log($("input[name=select]:checked").val());
            }
        });

    </script>


</body>
</html>