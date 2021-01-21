<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

    <style>
        * {
            font-family: 'Noto Sans KR';
        }
        
        .content-wrap {
            width: 300px;
            margin: 0 auto;
            margin-top: 150px;
            margin-bottom: 150px;
            text-align: center;
        }
        
        .search-tile {
        	font-weight: bolder;
        }
        
        /*---------------------------------*/
        
        .search-input {
            margin-top: 30px;
        }
        
        .search-input>form>input {
            width: 285px;
            height: 40px;
            margin-top: 10px;
            border-radius: 5px;
            outline: none;
            border: 1px solid #cccccc;
            padding-left: 7px;
            font-size: 16px;
        }
        
        .search-btn {
            width: 280px;
            height: 50px;
            border-radius: 5px;
            outline: none;
            border: none;
            background-color: #383a3f;
            color: white;
            cursor: pointer;
            font-size: 17px;
        }
    </style>
    
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="content-wrap">
        <div class="searchBox">
            <h1 class="search-tile">비밀번호찾기</h1>
            
            <div class="search-input">
                <form action="/searchPw.do" method="post">
                    <input type="text" name="memberId" size="20" value="" placeholder="아이디를 입력해주세요" required><br>
                    <input type="text" name="memberEmail" size="20" placeholder="가입 시 작성하신 이메일을 입력해주세요" required>
					<br><br><br>
                    <button type="submit" class="search-btn">확인</button>
                </form>
            </div>
        </div>
    </div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>