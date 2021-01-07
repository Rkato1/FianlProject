<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

<style>
        .section-size{
            width: 1000px;
            margin: 0 auto;
        }
        .section-mid-size{
            width: 1100px;
            height: 1180px;
            margin: 0 auto;
        }
        .bootcol{
            margin: 0;
            padding: 0;
        }
        .one{
            float: left;
        }
        .one>p{
            display: inline;
            margin: 0;
        }
        .two{
            float: left;
            margin-top: 8px;
            padding: 0;
        }
        .two>li{
            list-style-type: none;
            float: left;
            margin-left: 25px;
        }
        #ware-select{
            width: 150px;
        }
        .searchBtn{
            background-color: #1d0202;;
            color: white;
            border: 0;
            border-radius: 3px;
            outline: 0;
            vertical-align: text-top;
            transition: background-color .5s;
            cursor: pointer;
        }
        .searchBtn:hover{
            background-color:#fa9b00;
            color: #1d0202;
            
        }
 
        .prd-item{
            width: 300px;
            height: 360px;
            margin-bottom: 30px;
            float: left;
            margin-left: 50px;
            transition: background-color 3s;
        }
        .prd-item img{
            object-fit: cover;
            width: 298px;
            height: 300px;
            
        }
        .prd-item img:hover{
            border: 2px solid #fa9b00;
            width: 298px;
            height: 300px;
        }
    </style>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section class="section-size" style="margin-bottom: 20px;">
        <div class="used-one" style="height: 30px;" >
            <div class="col-md-9 one bootcol" style="padding: 0;">
                <p style="font-size: 20px; font-weight: 700;">중고거래</p>
                <p style="font-size: 14px;"> 정직한 중고거래를 실천합시다</p>
            </div>
            <ul class="col-md-3 two bootcol" style="font-size: 14px; padding: 0;">
                <li style="cursor: pointer; color: #252525;">최근순</li>
                <li style="color: #6d6c3f;"> | </li>
                <li style="cursor: pointer; color: #252525;">가격순</li>
                <li style="color: #6d6c3f;"> | </li>
                <li style="cursor: pointer; color: #252525;">이름순</li>
            </ul>
        </div>
        <hr style="border: 2px solid #1d0202; margin-top: 5px; margin-bottom: 5px;">
        <div class="used-two" style="height: 30px; vertical-align: middle;">
            <div class="col-md-11 bootcol one" style=" padding: 0;">
            <select name="ware" id="ware-select" style="font-size: 10pt; height: 22px;">
                <option value="" selected>직접선택</option>
                <option value="텐트/타프">텐트/타프</option>
            </select>
                <input type="text" placeholder="검색" style="height: 22px; font-size: 10pt; margin-left: 8px;">
                <button class="material-icons searchBtn" style="font-size: 16px; height: 22px;">search</button>
            </div>
            <div class="col-md-1 bootcol one" style="vertical-align: middle;  padding: 0;">
               <a href="/usedEnroll.do"><input type="button" value="물품등록" style="font-size: 16px; height: 22px; font-size: 13px; margin-left: 20px;" class="searchBtn"></a>
            </div>
        </div>
    </section>
    <section class="section-mid-size">
        <div class="prd-item">
            <div style="height: 300px; width: 300px;">
                <a href="/usedDatail.do"><img src="/img/camp.png"></a>
            </div>
            <div style="text-align: center; margin-top: 10px;">중고가격에 팝니다~!!</div>
            <div style="text-align: center; font-weight: 600; font-size: 14px;">1,000,000 원</div>
        </div>
    </section>
    <section style="text-align: center;">
        12345
    </section>
    <footer style="margin-top:200px; text-align: center;"><h1>푸터입니다.</h1></footer>
</body>
</html>