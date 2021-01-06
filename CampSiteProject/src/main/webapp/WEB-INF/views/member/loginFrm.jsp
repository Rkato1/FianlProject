<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        
        .login-tile {
        	font-weight: bolder;
        }
        
        /*---------------------------------*/
        
        .login-input {
            margin-top: 30px;
        }
        
        .login-input>form>input {
            width: 285px;
            height: 40px;
            margin-top: 10px;
            border-radius: 5px;
            outline: none;
            border: 1px solid #cccccc;
            padding-left: 10px;
            font-size: 16px;
        }
        
        
        /*---------------------------------*/
        
        .login-search {
            text-align: right;
            margin: 10px;
            margin-bottom: 60px;
        }
        
        .login-search>a, .login-search>span {
            text-decoration: none;
            color: dimgray;
            font-size: 14px;   
        }
        
        .login-search>a:hover {
            color: #f49b00;
        }
    
        /*---------------------------------*/

        .loginBtn {
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

        .joinBtn {
            width: 280px;
            height: 50px;
            border: 2px solid #383a3f;
            border-radius: 5px;
            outline: none;
            background-color: white;
            margin-top: 8px;
        }
        
        .joinBtn>a {
            text-decoration: none;
            color: #383a3f;
            display: block;
            font-size: 16px;
            font-weight: bolder;
        }
    </style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="content-wrap">
        <div class="loginBox">
            <h1 class="login-tile">로그인</h1>
            
            <div class="login-input">
                <form action="/login.do" method="post">
                    <input type="text" name="memberId" size="20" value="" placeholder="아이디를 입력해주세요" required><br>
                    <input type="password" name="memberPw" size="20" placeholder="비밀번호를 입력해주세요" required>

                    <div class="login-search">
                        <a href="#">아이디 찾기</a>
                        <span class="bar">|</span>
                        <a href="#"> 비밀번호 찾기</a>
                    </div>

                    <button type="submit" class="loginBtn">로그인</button>
                </form>
                <button type="button" class="joinBtn"><a href="/joinFrm.do">회원가입</a></button>
            </div>
        </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>