<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품등록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<style>
    body{
      letter-spacing: 1px;
    }
    .section-size{
            width: 1000px;
            margin: 0 auto;
        }
        .bootcol{
            margin: 0;
            padding: 0;
        }
        p{
          margin: 0;
        }
        .table{
          margin-bottom: 0rem !important;
        }
        .tbl td{
          padding-left: 20px;
          padding-top: 15px;
          padding-bottom: 15px;
        }
        .tbl td:first-child{
          padding: 20px;
          border-right: 1px solid  #1d0202;
          font-weight: 400;
          width: 100px;
          font-size: 14px;
        }
        .tbl tbody tr td:last-child{
          width: 800px;
          font-weight: 300;
          line-height: 10px;
          padding-top: 18px;
        }
        .table td, .table th {
          border-top: 1px solid  #1d0202;
        }
        .inpText{
          font-size: 12px;
          width: 300px;
          height: 25px;
          color: #6c757d;
        }
        .inpTextrea{
          font-size: 12px;
          color: #6c757d;
        }
        .imgUpload-size{
          width: 100px;
          height: 100px;
          border: 1px solid #e0e0e0;
          float: left;
          margin-right: 20px;
        }
        .enrollBtn{
            background-color: #1d0202;;
            color: white;
            border: 0;
            border-radius: 3px;
            outline: 0;
            vertical-align: text-top;
            transition: background-color .5s;
            cursor: pointer;
            width: 130px;
            height: 40px;
            font-size: 18px;
            letter-spacing: 2px;
            margin-top: 10px;
            margin-left: 870px;
        }
        .enrollBtn:hover{
            background-color:#fa9b00;
            color: #1d0202;
        }
        #fileBtn{
            background-color: #1d0202;
            color: white;
            border: 0;
            border-radius: 3px;
            outline: 0;
            vertical-align: text-top;
            transition: background-color .5s;
            cursor: pointer;
            width: 130px;
            height: 40px;
            font-size: 18px;
            letter-spacing: 2px;
        }
        #file:hover{
            background-color:#fa9b00;
            color: #1d0202;
        }
  </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="section-size">
    <div class="bootcol">
      <p style="font-size: 20px; font-weight: 700;">물품등록</p>
    </div>
    <hr style="border: 2px solid #1d0202; margin-top: 5px; margin-bottom: 0px;">
  </section>
  <form action="/usedEnroll.do" method="post">
  <section class="section-size">         
      <table class="table tbl">
        <tbody>
          <tr>
            <td>상품명</td>
            <td><input class="inpText" type="text" placeholder="상품명 입력"></td>
          </tr>
          <tr>
            <td>상품종류</td>
            <td>
              <select name="category" class="inpText">
                <option value="" selected>직접선택</option>
                <option value="텐트/타프">텐트/타프</option>
                <option value="의자/테이블">의자/테이블</option>
                <option value="침낭/매트">침낭/매트</option>
                <option value="코펠/식기">코펠/식기</option>
                <option value="버너/난로">버너/난로</option>
                <option value="랜턴/후레쉬">래턴/후레쉬</option>
                <option value="화로/바베큐용품">화로/바베큐용품</option>
                <option value="가방/케이스">가방/케이스</option>
                <option value="해먹/침대">해먹/침대</option>
                <option value="캠핑소품">캠핑소품</option>
                <option value="캠프차량용품">캠프차량용품</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>금액입력</td>
            <td><input type="text" class="inpText" placeholder="금액을 입력해주세요."></td>
          </tr>
          <tr>
            <td>거래지역</td>
            <td>
              <select name="area" class="inpText">
                <option value="전국" selected>전국</option>
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
                <option value="광주">광주</option>
                <option value="부산">부산</option>
                <option value="대구">대구</option>
                <option value="대전">대전</option>
                <option value="울산">울산</option>
                <option value="강원">강원</option>
                <option value="경북">경북</option>
                <option value="경남">경남</option>
                <option value="전남">전남</option>
                <option value="전북">전북</option>
                <option value="충남">충남</option>
                <option value="충북">충북</option>
                <option value="세종">세종</option>
                <option value="제주">제주</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>제품상태</td>
            <td>
              <select name="used" class="inpText">
                <option value="중고" selected>중고</option>
                <option value="새상품" selected>새상품</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>교환여부</td>
            <td>
              <select name="trade" class="inpText">
                <option value="교환가능" selected>교환가능</option>
                <option value="교환불가능" selected>교환불가능</option>
              </select>
            </td>
          </tr>
          <tr>
            <td style="line-height: 100px;">상품설명</td>
            <td>
              <textarea class="inpTextrea" name="expl" id="" cols="80" rows="10" style="resize: none;" placeholder="상품에 대한 설명을 적어주세요."></textarea>
            </td>
          </tr>
          <tr>
            <td style="line-height: 100px;">사진첨부</td>
            <td>
              <div class="imgUpload-size"></div>
              <div class="imgUpload-size"></div>
              <div class="imgUpload-size"></div>
              <input type="file" name="file" value="" id="">
            </td>
          </tr>
        </tbody>
      </table>
      <hr style="border: 2px solid #1d0202; margin-top: 0px; margin-bottom: 0px;">
      <input type="submit" class="enrollBtn" value="등록하기">
  </section>
</form>
  <div style="height: 200px"></div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>