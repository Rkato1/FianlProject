<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        * {
            font-family: 'Noto Sans KR';
        }

        .content-wrap {
            width: 800px;
            margin: 0 auto;
            background-color: white;
            box-sizing: border-box;
        }

        .mypage-header {
            width: 750px;
            height: 100px;
            margin: 0 auto;
        }

        .mypage-header>p {
            margin: 0;
            padding: 0;
        }

        .mypage-title {
            font-size: 30px;
            font-weight: bolder;
            color: #f49b00;
        }

        .mypage-subtitle {
            color: dimgray;
        }

        .mypage-subtitle>span {
            font-weight: bolder;
            color: black;
        }

        /*--------------------------------*/


        .mypage-menu {
            width: 600px;
            overflow: hidden;
            margin: 0 auto;
            margin-top: 10px;
            margin-bottom: 60px;
        }


        .menu-img {
            width: 80px;
            height: 80px;
            text-align: center;
            float: left;
            margin-left: 33px;
        }

        .menu-img>a {
            text-decoration: none;
            color: black;
            font-size: 55px;
        }

        .menu-text {
            text-align: center;
            float: left;
            width: 65px;
            margin-top: 25px;
        }

        .num {
            color: #f49b00;
        }


        /*--------------------------------*/

        .reserve-table {
            margin: 0 auto;
            width: 750px;
            font-size: 14px;
        }

        .reserve-table>thead>tr>th {
            text-align: center;
        }

        .reserve-table>tbody>tr>td {
            text-align: center;
        }

        .reserve-table>thead>tr {
            background-color: #d3d3d3;
        }
        
        .state {
            color: #f49b00;
        }

    </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div class="content-wrap">
        <div class="mypage-header">
            <p class="mypage-title">MYPAGE</p>
            <p class="mypage-subtitle"><span>${m.memberName }</span>님 접속을 환영합니다.</p>
        </div>
        <div class="mypage-menu">
            <div class="menu-img">
                <a href="#"><i class="far fa-calendar-alt icon"></i></a>
            </div>
            <div class="menu-text">
                <span>예약내역</span>
                <span class="num">(3)</span>
            </div>


            <div class="menu-img">
                <a href="#"><i class="far fa-thumbs-up icon"></i></a>
            </div>
            <div class="menu-text">
                <span>후기내역</span>
                <span class="num">(3)</span>
            </div>


            <div class="menu-img">
                <a href="#"><i class="fas fa-user-friends icon"></i></a>
            </div>
            <div class="menu-text">
                <span>거래내역</span>
                <span class="num">(3)</span>
            </div>
        </div>

        <div class="mypage-table">
            <form action="/updateMember" method="post">
                <table class="table table-bordered reserve-table">
                    <thead>
                        <tr>
                            <th>예약일자</th>
                            <th>캠핑장</th>
                            <th>금액</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<tr>
                        	<td>2020-12-30</td>
                        	<td>충남 맑은 하늘 캠핑장</td>
                        	<td>200.000원</td>
                        	<td class="state">이용완료</td>
                    	</tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>