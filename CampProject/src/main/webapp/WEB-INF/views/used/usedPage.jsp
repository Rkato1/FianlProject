<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            height:800px;
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
            background-color: #1d0202;
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
            transition: background-color .5s;
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
        .items-navi {
        text-align: center;
        height: 250px;
    	}
    	.btn-outline-primary {
    	background-color: #1d0202 !important;
        color: white !important;
        border-color: white !important;
        transition: background-color .5s !important;
		}
		.btn-outline-primary:hover {
    	background-color: #fa9b00 !important;
        color: black !important;
        border-color: white !important;
		}
		#prd-item-click{
			text-decoration: none;
			color: #1d0202;

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
        <div class="used-two" style="height: 30px;">
            <div class="col-md-11 bootcol one" style=" padding: 0;">
            <select name="ware" id="ware-select" style="font-size: 10pt; height: 22px;">
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
            <form action="/searchKeyword.do" method="get" style="display: inline;">
                <input type="text" name="searchKeyword" placeholder="검색" style="height: 22px; font-size: 10pt; margin-left: 8px; padding: 0;">
                <input type="submit" class="material-icons searchBtn" value="search" style="font-size: 16px; height: 22px; margin-top: 3px;">
            </form>
            </div>
            <div class="col-md-1 bootcol one" style="vertical-align: middle;  padding: 0;">
            	<c:if test="${sessionScope.m != null }">
               		<a href="/usedEnroll.do"><input type="button" value="물품등록" style="font-size: 16px; height: 22px; font-size: 13px; margin-left: 20px;" class="searchBtn"></a>
                </c:if>
            </div>
        </div>
    </section>
    <section class="section-mid-size">
    <!-- 변수 -->
    <c:set var="size" value="${list.size() }" />
			<c:set var="end1" value="${size/3 }" />
			<c:if test="${size % 3 > 0}">
				<c:set var="end1" value="${end1+1 }" />
			</c:if>
			<c:set var="idx" value="0" />
	
   	 <c:forEach var="u" begin="1" end="${end1 }">
   	 			<c:choose>
					<c:when test="${size > 3}">
						<c:set var="end2" value="3" />
					</c:when>
					<c:otherwise>
						<c:set var="end2" value="${size }" />
						<c:set var="end3" value="${3-size }" />
					</c:otherwise>
				</c:choose>
				<c:set var="size" value="${size-3 }" />
        <c:forEach var="j" begin="1" end="${end2}">
        <c:set var="c" value="${list[idx] }" />
        <div class="prd-item">
            <div style="height: 300px; width: 300px; border: 1px solid #e0e0e0;">
                <a href="/usedDatail.do?usedNo=${c.usedNo }">
                <img src="resources/upload/used/${c.file[0].filepath }">
                </a>
            </div>
            <div style="text-align: center; margin-top: 10px;"><a href="/usedDatail.do?usedNo=${c.usedNo }" id="prd-item-click">${c.usedTitle }</a></div>
            <div style="text-align: center; font-weight: 600; font-size: 14px;"><a href="/usedDatail.do?usedNo=${c.usedNo }" id="prd-item-click">${c.usedPrice } 원</a></div>
        </div>
        <c:set var="idx" value="${idx+1 }" />
            </c:forEach>
            <c:forEach var="j" begin="1" end="${end3}">
				<div class="item"></div>
			</c:forEach>
      </c:forEach>
    </section>
    <section class="container">
        <div class="items-navi">
			<div class="btn-group">${pageNavi }</div>
		</div>
    </section>
    <div style="height: 200px"></div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <%-- <fmt:formatNumber value="${c.usedPrice }" pattern="###,###,###"/> --%>
   	<script>
   		/* $("#ware-select").change(function(){
   			var ware = $("#ware-select").val();
   			console.log(ware);
   			$.ajax({
   				type:"GET", //전송 방법
   				url : "/selectSearch.do",
   				data : {ware : ware},
   				datatype : 
   			})
   		}) */
   	</script>
</body>
</html>