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
<head>
<meta charset="UTF-8">
<title>Create A Camp</title>
    <style>
        body {
            height: 100vh;
            background-image: url(resources/upload/common/sunset.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }

        .logo-wrap {
            overflow: hidden;
            width: 70vw;
            margin: 0 auto;
            margin-top: 80px;
            margin-bottom: 10px;
        }

        .logo-text {
            font-family: 'Russo One';
            float: left;
            font-size: 52px;
            padding-left: 8px;
            padding-right: 8px;
            padding-top: 5px;
            color: white;
        }

        .logo-img {
            width: 54px;
            height: 54px;
            float: left;
        }

        .logo-img>img {
            width: 100%;
            height: 100%;
        }

        .logo-link {
            float: left;
            color: white;
            padding-top: 10px;
            font-size: 40px;

        }

        /*--------------------------------------------*/

        .search-wrap {
            background-color: rgba(0, 0, 0, 0.5);
            width: 70vw;
            max-width: 1040px;
            min-width: 552px;
            margin: 0 auto;
            padding: 25px;
            color: #f49b00;
            overflow: hidden;
        }

        .search-wrap>div {
            font-family: 'Russo One';
            font-weight: 100;
            font-size: 1em;
            float: left;
            margin-top: 12px;
            margin-right: 30px;
        }

        .search-where {
            width: 25vw;
            margin-left: 25px;
            min-width: 350px;
        }

        .search-where>input {
            margin-top: 8px;
            width: 100%;
            height: 25px;
            outline: none;
        }

        .search-check {
            width: 12vw;
            min-width: 120px;
        }

        .search-check>input {
            margin-top: 8px;
            width: 100%;
            height: 25px;
            outline: none;
        }

        .search-button {
            min-width: 9vw;
            padding-top: 28px; 
        }

        .search-button>input {
            font-family: 'Russo One';
            width: 100%;
            height: 32px;
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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="logo-wrap">
        <a href="/login.do">
            <div class="logo-text">create</div>
            <div class="logo-img"><img src="resources/upload/common/tentw.png"></div>
            <div class="logo-text">camp</div>
            <div class="logo-link"><i class="fas fa-angle-double-right"></i></div>
        </a>
    </div>

    <form method="get">
        <div class="search-wrap">
            <div class="search-where">
                <span><span style="color: white">Where</span> Do You <span style="color: white">Want</span> To Go?</span>
                <input type="text">
            </div>
            <div class="search-check">
                <span><span style="color: white">Check</span> In</span>
                <input type="text" id="checkIn">

            </div>
            <div class="search-check">
                <span><span style="color: white">Check</span> Out</span>
                <input type="text" id="checkOut">
            </div>
            <div class="search-button">
                <input type="submit" value="Search">
            </div>
        </div>
    </form>
    
    <script>
    $(function() {

        var dateToday = new Date(new Date().getTime());
        var oneDayAhead = new Date(new Date().getTime() + 24 * 60 * 60 * 1000); 
        
        $("#checkIn").datepicker({
                changeMonth: true,
                minDate: dateToday,
                dateFormat: 'yy-mm-dd',
        }); 
        
        $("#checkOut").datepicker({
                changeMonth: true,
                minDate: oneDayAhead,
                dateFormat: 'yy-mm-dd',
        });

    });
	</script>

</body>
</html>