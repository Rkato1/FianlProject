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
        
        /*-------------------------------*/
        
        .search-result {       
        	padding-top: 20px;       
        }
        
        .search-span {
            color: #f49b00;
            font-weight: bolder;
        }
        
        /*-------------------------------*/
        
        .login-btn {
            width: 280px;
            height: 50px;
            border: 2px solid #383a3f;
            border-radius: 5px;
            outline: none;
            background-color: #383a3f;
            margin-top: 8px;
        }
        
        #login-btn-a {
            text-decoration: none;
            color: white;
            display: block;
            font-size: 16px;
            font-weight: bolder;
        }
    </style>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="content-wrap">
        <div class="search-box">
            <h1 class="search-tile">비밀번호 찾기</h1>
            
            <div class="search-result">
                <p>${m.memberId }님의 비밀번호는 [&nbsp;<span class="search-span">${m.memberPw }</span>&nbsp;] 입니다. </p>
                <br><br>
                <button type="button" class="login-btn"><a href="/loginFrm.do" id="login-btn-a">로그인 하러 가기</a></button>
            </div>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>