<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품수정</title>
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
          margin-bottom: 0;
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
          text-indent: .3em;
        }
        .inpTextrea{
          font-size: 12px;
          color: #6c757d;
          letter-spacing: 1px;
          text-indent: .2em;
        }
        .imgUpload-size{
          width: 100px;
          height: 100px;
          border: 1px solid #e0e0e0;
          float: left;
          margin-right: 20px;
        }
        .imgUpload-size:hover{
          opacity: 0.5;
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
        .input-file-button{
        	margin-top : 17px;
        	line-height: 25px;
			padding: 10px 20px;
			background-color: #1d0202;
			border-radius: 4px;
			color: white;
			cursor: pointer;
			transition: background-color .5s;
		}
		.input-file-button:hover{
		 	background-color:#fa9b00;
            color: #1d0202;
		}
  </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="section-size">
    <div class="bootcol">
      <p style="font-size: 20px; font-weight: 700;">물품수정</p>
    </div>
    <hr style="border: 2px solid #1d0202; margin-top: 5px; margin-bottom: 0px;">
  </section>
  <section class="section-size">         
  <form action="/updateEnrollEnd.do" method="post" autocomplete="off" enctype="multipart/form-data" accept-charset="UTF-8">
  	  <input type="hidden" value="${u.usedNo }" name="usedNo"/>
      <table class="table tbl">
        <tbody>
        <tr>
            <td>작성자</td>
            <td><input class="inpText" type="text" value="${sessionScope.m.memberId }" name="usedWriter" readonly></td>
          </tr>
          <tr>
            <td>상품명</td>
            <td><input class="inpText" type="text" placeholder="상품명 입력" name="usedTitle" id="title" value="${u.usedTitle }"><span id="sp1"></span></td>
          </tr>
          <tr>
            <td>상품종류</td>
            <td>
              <select name="category" class="inpText" id="category">
                <option value="${u.category }" selected>${u.category }</option>
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
              <span id="sp2"></span>
            </td>
          </tr>
          <tr>
            <td>금액입력</td>
            <td><input type="text" class="inpText" placeholder="숫자만 입력해주세요." name="usedPrice" id="price" value="${u.usedPrice }"><span id="sp3"></span></td>
          </tr>
          <tr>
            <td>거래지역</td>
            <td>
              <select name="usedArea" class="inpText"> 
                <option value="${u.usedArea }" selected>${u.usedArea }</option>
                <option value="전국">전국</option>
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
              <select name="usedState" class="inpText">
                <option value="${u.usedState }" selected>${u.usedState }</option>
                <option value="중고">중고</option>
                <option value="새상품">새상품</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>교환여부</td>
            <td>
              <select name="usedChange" class="inpText">
                <option value="${u.usedChange }" selected>${u.usedChange }</option>
                <option value="교환가능">교환가능</option>
                <option value="교환불가능">교환불가능</option>
              </select>
            </td>
          </tr>
          <tr>
            <td style="line-height: 100px;">상품설명</td>
            <td>
              <textarea class="inpTextrea" name="usedContent" id="content" cols="80" rows="7" style="resize: none; line-height: 14px;" placeholder=" 상품에 대한 설명을 적어주세요." spellcheck="false">${u.usedContent }</textarea>
              <span id="sp4"></span>
            </td>
          </tr>
        </tbody>
      </table>
      <hr style="border: 2px solid #1d0202; margin-top: 0px; margin-bottom: 0px;">
      <input type="submit" class="enrollBtn" value="수정하기" id="enrollBtn">
</form>
  </section>
  <div style="height: 200px"></div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  
  <script>
  
  	//가격입력시 3자리 마다 , 추가하는 코드
 	 $(document).on('keyup','input[id=price]',function(event){
		this.value = this.value.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
		this.value = this.value.replace(/,/g,'');          // ,값 공백처리
		this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 
		}); 
  	 
  $(function(){
  	
  	//상품명 조건
  	$("#title").change(function(){
  	  	var title = $("#title").val();
  		var expTitle = /^[A-Za-z0-9가-힣ㄱ-ㅎ/b./s ]{5,30}$/;
  		var expTitle1 = /[~!@#$%^&*()_+|<>?:{}]{1,30}/;
  		if(!expTitle.test(title) && !expTitle1.test(title)){
  			$("#sp1").text(" 상품명을 한글,숫자로 5글자 이상 30글자 이하로 적어주세요.");
  			$("#sp1").css("color","#fa9b00");
  			$("#sp1").css("font-size","12px");
  			$("#title").css("border","2px solid #fa9b00");
  		}else{
  			$("#sp1").text("");
  			$("#title").css("border","1px solid #6c757d");
  			
  		}
  	});
  	//가격을 적지 않을 시에
  	$("#price").change(function(){
  		var price = $("#price").val();
  		if(price == '') {
  			$("#sp3").text(" 가격을 입력해주세요.");
  			$("#sp3").css("color","#fa9b00");
  			$("#sp3").css("font-size","12px");
  			$("#price").css("border","2px solid #fa9b00");
  			
  		}else{
  			$("#sp3").text("");
  			$("#price").css("border","1px solid #6c757d");
  			
  		}
  	});
  	//상품 종류 선택시
  	$("#category").change(function(){
  		var cate = $("#category").val();
  		if(cate == '') {
  			$("#sp2").text(" 상품의 종류를 입력해주세요.");
  			$("#sp2").css("color","#fa9b00");
  			$("#sp2").css("font-size","12px");
  			$("#category").css("border","2px solid #fa9b00");
  			
  		}else{
  			$("#sp2").text("");
  			$("#category").css("border","1px solid #6c757d");
  			
  		}
  	});
  	//상품상세설명 
  	$("#content").keyup(function(){
  		var content = $("#content").val();
  		var expContent = /^[A-Za-z0-9가-힣ㄱ-ㅎ/b./s ((.|\n)*)]{5,300}$/;
  		var expContent1 = /[~!@#$%^&*()_+|<>?:{}]{1,300}/;
  	  	if(!expContent.test(content) && !expContent1.test(content)) {
  	  		$("#sp4").text(" 상품에 대한 설명을 입력해주세요.(5글자 이상 300글자 이하)");
  	  		$("#sp4").css("color","#fa9b00");
  	  		$("#sp4").css("font-size","12px");
  			$("#content").css("border","2px solid #fa9b00");
  	  	}else{
  	  		$("#sp4").text("");
  	  		$("#content").css("border","1px solid #6c757d");
  	  	}
  	});
  	
  	//클릭시 이벤트
  	$("#enrollBtn").click(function(event){
  	  		//버튼클릭시 상품종류가 선택이 안되어있으면
  	  		var title = $("#title").val();
			var cate = $("#category").val();
		  	var price = $("#price").val();
		  	var content = $("#content").val();
		  	
	  		if(title == '') {
	  			$("#sp1").text(" 상품명을 한글,숫자로 5글자 이상 30글자 이하로 적어주세요.");
	  			$("#sp1").css("color","#fa9b00");
	  			$("#sp1").css("font-size","12px");
	  			$("#title").css("border","2px solid #fa9b00");
	  			event.preventDefault();
	  		}
	  		if(cate == '') {
	  			$("#sp2").text(" 상품의 종류를 입력해주세요.");
	  			$("#sp2").css("color","#fa9b00");
	  			$("#sp2").css("font-size","12px");
	  			$("#category").css("border","2px solid #fa9b00");
	  			event.preventDefault();
	  		}
	  		if(price == '') {
	  			$("#sp3").text(" 가격을 입력해주세요.");
	  			$("#sp3").css("color","#fa9b00");
	  			$("#sp3").css("font-size","12px");
	  			$("#price").css("border","2px solid #fa9b00");
	  			event.preventDefault();
	  		}
	  		if(content == '') {
	  			$("#sp4").text(" 상품에 대한 설명을 입력해주세요.(5글자 이상 300글자 이하)");
	  			$("#sp4").css("color","#fa9b00");
	  			$("#sp4").css("font-size","12px");
	  			$("#content").css("border","2px solid #fa9b00");
	  			event.preventDefault();
	  		}
  	});
  });
  </script>
</body>
</html>