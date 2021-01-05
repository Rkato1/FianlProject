<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Google Fonts -->
<html lang="kr">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    
    	.header-all-wrap {
    		margin-bottom: 80px;
    	}

        .header-title {
            width: 100%;
            background-color: #1d0e0e;
            color: #f49b00;
            text-align: center;
            height: 42px;
            line-height: 42px;
        }

        .header-title>pre {
            font-family: 'Noto Sans KR';
            font-size: 0.9em;
        }

        /*---------------------------------------*/

        .header-wrap {
            /*border-bottom: 2px solid #f49b00;*/
            background-color: #fafafa;
        }
        
        /*---------------------------------------*/
        
        .header-user {
            height: 37px;
            overflow: hidden;
        }

        .header-user>ul {
            list-style: none;
            padding: 0px;
            overflow: hidden;
            float: right;
            padding-right: 30px;
        }

        .header-user>ul>li {
            float: left;
            padding-left: 18px;

        }

        .header-user>ul>li>a {
            text-decoration: none;
            font-family: 'Noto Sans KR';
            font-size: 15px;
            color: #a4a4a4;
        }

        .header-user>ul>li>a:hover {
            font-weight: bolder;
        }

        /*---------------------------------------*/

        .header-logo {
            overflow: hidden;
            width: 680px;
            margin: 0 auto;
            margin-top: 40px;
            margin-bottom: 30px;
        }

        .header-logo>a {
            color: #1d0e0e;
        }


        .logo-text {
            font-family: 'Russo One';
            font-size: 85px;
            float: left;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 10px;
        }

        .logo-img {
            width: 90px;
            height: 90px;
            float: left;
        }

        .logo-img>img {
            width: 100%;
            height: 100%;
        }

        /*---------------------------------------*/

        .header-navi {
            padding-bottom: 35px;
            /* 전체 구분선
            border-bottom: 2px solid #d3d3d3;
            */
        }

        .header-navi>ul {
            list-style: none;
            overflow: hidden;
            width: 825px;
            margin: auto;
            padding: 0;
        }

        .header-navi>ul>li {
            float: left;
            width: 200px;
            padding: 0px;
            border-left: 2px solid #1d0e0e;
        }

        .header-navi>ul>li:last-child {
            border-right: 2px solid #1d0e0e;
        }


        .header-navi>ul>li>a {
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            text-align: center;
            font-size: 16px;
            color: #1d0e0e;
            box-sizing: border-box;
            font-family: 'Noto Sans KR';
            display: inline-block;
        }

        .header-navi>ul>li>a:hover {
            color: #f49b00;
            font-weight: bolder
        }
    </style>
</head>
<body>
    <div class="header-all-wrap">
        <div class="header-title">
            <pre>새 로 운     캠 핑 문 화 를     함 께    만 들 어     갈     사 람 들 을     기 다 립 니 다</pre>
        </div>
        <div class="header-wrap">
            <div class="header-user">
                <ul>
                    <li><a href="#">JOIN</a></li>
                    <li><a href="#">LOGIN</a></li>
                    <li><a href="#">MYPAGE</a></li>
                </ul>
            </div>
            <div class="header-logo">
                <a href="#">
                    <div class="logo-text">create</div>
                    <div class="logo-img"><img src="resources/upload/common/tentb.png"></div>
                    <div class="logo-text">camp</div>
                </a>
            </div>
            <div class="header-navi">
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">캠핑장예약</a></li>
                    <li><a href="#">캠핑후기</a></li>
                    <li><a href="#">중고거래</a></li>
                </ul>
            </div>
        </div>
    </div>

</body>
</html>