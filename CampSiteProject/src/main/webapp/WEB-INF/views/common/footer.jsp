<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
    
    	html,
        body {
            margin: 0;
            padding: 0;
        }
        
        * {
            font-family: 'Noto Sans KR';
        }

        .footer-wrap {
            width: 100%;
            height: 180px;
            background-color: #1d0e0e;
            box-sizing: border-box;
            overflow: hidden;
            margin: 0 auto;
            margin-top: 80px;
        }

        .footer-info {
            width: 800px;
            padding: 20px;
            float: left;
        }

        .footer-info>span {
            color: white;
            font-weight: lighter;
            display: block;
        }

        .footer-info>span:last-child {
            color: #f49b00;
        }

        .footer-sns {
            width: 220px;
            height: 50%;
            box-sizing: border-box;
            float: right;
        }

        .sns-wrap {
            overflow: hidden;
            list-style: none;
        }

        .sns-item {
            float: left;
        }

        .sns-img {
            width: 40px;
            height: 40px;
            padding-left: 10px;
        }

        .sns-img>img {
            width: 100%;
            height: 100%;
        }

    </style>
</head>
<body>
    <div class="footer-wrap">
        <div class="footer-info">
            <span>상호명 : ㈜Before And After | 사업자등록번호 : 878-65-88452</span>
            <span>ADDR : (07212) 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F</span>
            <span>
                TEL : 02-1544-9970 (상담시간 : 평일 10:00 ~ 18:00) | FAX : 02-2163-8560
            </span>
            <br><br>
            <span>Copyrights(c) 2020 BEFORE AND AFTER ALL RIGHTS RESERVED.</span>
        </div>
        <div class="footer-sns">
            <ul class="sns-wrap">
                <li class="sns-item">
                    <a href="#">
                        <div class="sns-img">
                            <img src="resources/upload/common/instagram.png">
                        </div>
                    </a>
                </li>
                <li class="sns-item">
                    <a href="#">
                        <div class="sns-img">
                            <img src="resources/upload/common/facebook.png">
                        </div>
                    </a>
                </li>
                <li class="sns-item">
                    <a href="#">
                        <div class="sns-img">
                            <img src="resources/upload/common/twitter.png">
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>