<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    @font-face {
        src : url("./BMJUA_ttf.ttf");
        font-family: "jua";
        font-weight: normal;
        font-style: normal;
    }
    body{
        font-family: "jua";
    }
    .admin-wrap {
        margin: 0 auto;
        width: 1500px;
        height: 1000px;
        border-radius: 20px;
        background-color: #9f807d;
    }
    
    .admin-menu {
        width: 200px;
        text-align: center;
        margin-top: 30px;
        height: 900px;
        background-color: #9f807d;
        display: inline-block;
        float: left;
    }

    .div1 {
        height: 20%;
    }

    .menuBox {
        height: 600px;
        margin: 0 auto;
        padding: 0;
    }

    .menu {
        list-style-type: none;
        margin: 0;
        padding: 0;
        font-weight: bold;
    }

    .profile-title {        
        font-size: 20pt;
        margin-bottom: 20px;
        font-weight: bold;
        color: #56373c;
    }

    .icon {
        width: 30px;
        float: left;
    }

    .menu li>a {        
        display: block;
        height: 45px;
        line-height: 45px;
        font-size: 10pt;
        color: #391e22;
        text-decoration: none;
    }

    .menu>li {
        text-align: left;
        text-indent: 10px;
        margin-left: 15px;
        padding-left: 15px;
        padding-top: 5px;
    }

    .div2 {
        height: 10%;
    }

    .admin-content {
        width: 1200px;         
        float: left;
        display: inline-block;
        height: 950px;
        border-radius: 10px;
        margin: 20px;
        background-color: white;
        text-align: center;
    }

    .real-content {
        display: inline-block;
    }

    .title {
        text-align: left;
        font-size: 25pt;
    }
    .th-short{
        width: 120px;
    }
    .th-long{
        width: 200px;
    }
    .table th{
        font-size: 11pt;
    }
    .table td{
        font-size: 10pt;
    }
    #pageNavi>*{
        text-align: center;
        margin: 10px;
    }
    .selectPage{
        color : #5f7880;
        font-weight: bold;

    }
</style>
<script>
        $(function() {
            $(".menu li>a").hover(function() {
                $(this).parent().css('background-color', '#d0b0b1');
            }, function() {
                $(this).parent().css('background-color', '#9f807d');
            });
        });
    </script>
<body>
    <div class="admin-wrap">
        <!--화면 좌측-->
        <div class="admin-menu">
            <div class="div1"></div>
            <div class="menuBox">
                <img class="circle profile" src="img/admin.svg" width="100px;">
                <div class="profile-title">
                    admin
                </div><br><br>
                <ul class="menu">
                    <li>
                        <a href="/">
                            <img src="img/icon_Home.svg" class="icon">\
                           	회원관리
                        </a>
                    </li>
                    <li>
                        <a href="/adminMembers?reqPage=1">
                            <img src="img/icon_members.svg" class="icon">
                                                        사업자관리
                        </a>
                    </li>
                    <li>
                        <a href="/reservationAllSearch?reqPage=1">
                            <img src="img/icon_reservation.svg" class="icon">
                            	예약관리
                        </a>
                    </li>
                    <li>
                        <a href="/adminQna?reqPage=1">
                            <img src="img/icon_Notice.svg" class="icon">
                            매출관리
                        </a>
                    </li>
                    <li>
                        <a href="/adminQna?reqPage=1">
                            <img src="img/icon_Notice.svg" class="icon">
                            우수캠핑장선정
                        </a>
                    </li>
                    <li>
                        <a href="/adminQna?reqPage=1">
                            <img src="img/icon_Notice.svg" class="icon">
                            고객센터
                        </a>
                    </li>
                </ul>
            </div>
            <div class="div1"></div>
        </div>
        <!--화면 우측-->
        <div class="admin-content">
            <div class="div2"></div>
            <div class="real-content">
                <div class="members">
                    <p class="title">전체예약정보</p>
                   
                    <table class="table table-hover">
                        <tr>
                            <th class="th-short"></th>
                            <th class="th-short"></th>
                            <th class="th-long"></th>
                            <th class="th-long"></th>
                            <th class="th-short"></th>
                            <th class="th-short"></th>
                            <th class="th-long"></th>
                        </tr>
						<tr>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                        	<td></td>
                       	</tr>
                    </table>
                    <div id= "pageNavi"></div>
                </div>
            </div>
            <div class="div2"></div>
        </div>

    </div> 
</body>
</html>