<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- Datepicker-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/js/main/main.js"></script>
<head>
<meta charset="UTF-8">
<title>Create A Camp</title>
    <style>
        * {
            font-family: 'Russo One';
        }

        html,
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .main-img {
            border: 0;
            padding: 0;
            background-image: url('resources/upload/common/sunset.jpg');
            min-height: 100%;
            background-position: center;
            background-size: cover;
        }

        .logo-wrap {
            overflow: hidden;
            width: 1200px;
            margin: 0 auto;
            padding-top: 150px;
            padding-bottom: 15px;
        }

        .logo-text {
            float: left;
            font-size: 65px;
            padding-left: 12px;
            padding-right: 12px;
            padding-top: 8px;
            color: white;
        }

        .logo-img {
            width: 70px;
            height: 70px;
            float: left;
        }

        .logo-img>img {
            width: 100%;
            height: 100%;
        }

        .logo-link {
            float: left;
            color: white;
            padding-top: 30px;
            font-size: 45px;
        }

        /*--------------------------------------------*/

        .search-wrap {
            background-color: rgba(0, 0, 0, 0.5);
            width: 1200px;
            margin: 0 auto;
            padding: 25px;
            padding-bottom: 30px;
            color: #f49b00;
            overflow: hidden;
        }

        .search-wrap>div {
            font-family: 'Russo One';
            font-weight: 100;
            font-size: 22px;
            float: left;
            margin-top: 12px;
            margin-right: 30px;
        }

        .search-where {
            width: 400px;
            margin-left: 25px;
        }

        .search-where>input {
            margin-top: 8px;
            width: 100%;
            height: 25px;
            outline: none;
            font-size: 15px;
            font-family: 'Noto Sans KR';
        }

        .search-check {
            width: 230px;
        }

        .search-check>input {
            margin-top: 8px;
            width: 100%;
            height: 25px;
            outline: none;
            font-size: 15px;
            font-family: 'Noto Sans KR';
        }

        .search-button {
            width: 180px;
            padding-top: 32px;
        }

        .search-button>button {
            width: 100%;
            height: 32px;
            font-size: 15px;
            color: white;
            background-color: #f49b00;
            outline: none;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <div class="main-img">

        <div class="logo-wrap">
            <a href="/loginFrm.do">
                <div class="logo-text">create</div>
                <div class="logo-img"><img src="resources/upload/common/tentw.png"></div>
                <div class="logo-text">camp</div>
                <div class="logo-link">
                    <i class="fas fa-angle-double-right"></i>
                </div>
            </a>
        </div>


        <form method="get">
            <div class="search-wrap">
                <div class="search-where">
                    <span><span style="color: white">Where</span> Do You <span style="color: white">Want</span> To Go?</span>
                    <input type="text" id="where">
                </div>
                <div class="search-check">
                    <span><span style="color: white">Check</span> In</span>
                    <input type="date" id="checkIn">

                </div>
                <div class="search-check">
                    <span><span style="color: white">Check</span> Out</span>
                    <input type="date" id="checkOut">
                </div>
                <div class="search-button">
                    <!-- input type="submit" value="Search"-->
                    <button type="button" onclick="Search()">Search</button>
                </div>
            </div>
        </form>

    </div>

</body>
</html>