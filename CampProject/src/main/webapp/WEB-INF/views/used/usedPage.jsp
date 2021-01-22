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
		body{
			padding: 0;
		}
        .section-size{
            width: 1200px;
            margin: 0 auto;
            padding-top: 50px;
        }
        .section-mid-size{
        	width : 1300px;
           	display: flex;
   			flex-direction: row;
    		flex-wrap: wrap;
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
            transition: background-color .2s;
            cursor: pointer;
            letter-spacing: 1px;
        }
        .searchBtn:hover{
            background-color:#fa9b00;
            color: #1d0202;
            
        }
 
        .prd-item{
            width:	250px;
            height: 310px;
            margin-bottom: 30px;
            margin-right: 67px;
            float: left;
            transition: background-color .2s;
        }
        .prd-item img{
            object-fit: cover;
            width: 248px;
            height: 248px;
            
        }
        .prd-item img:hover{
            border: 2px solid #fa9b00;
            width: 248px;
            height: 248px;
        }
        .items-navi {
        text-align: center;
        height: 250px;
    	}
    	.btn-outline-primary {
    	background-color: #1d0202 !important;
        color: white !important;
        border-color: white !important;
        transition: background-color .2s !important;
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
    <section class="section-size">
        <div class="used-one" style="height: 30px;" >
            <div class="col-md-9 one bootcol" style="padding: 0;">
                <p style="font-size: 26px; font-weight: 900;">중고거래</p>&nbsp;&nbsp;
                <p style="font-size: 16px; color: #fa9b00">새로운 문화를 즐기는 Create A Camp 중고거래</p>
            </div>
        </div>
        <hr style="border: 2px solid #1d0202; margin-top: 10px; margin-bottom: 8px;">
        <div class="used-two" style="height: 28px; margin-bottom:20px;">
            <div class="col-md-10 bootcol one" style=" padding: 0;">
            <!-- <select name="ware" id="ware-select" style="font-size: 10pt; height: 30px; vertical-align: middle;">
                <option value="" selected>카테고리선택</option>
                <option value="텐트/타프">텐트/타프</option>
                <option value="의자/테이블">의자/테이블</option>
                <option value="침낭/매트">침낭/매트</option>
                <option value="코펠/식기">코펠/식기</option>
                <option value="버너/난로">버너/난로</option>
                <option value="랜턴/후레쉬">랜턴/후레쉬</option>
                <option value="화로/바베큐용품">화로/바베큐용품</option>
                <option value="가방/케이스">가방/케이스</option>
                <option value="해먹/침대">해먹/침대</option>
                <option value="캠핑소품">캠핑소품</option>
                <option value="캠프차량용품">캠프차량용품</option>
            </select> -->
             <form action="/usedSearch.do?keyword" method="post" style="display: inline;">
            	<input type="hidden" name="reqPage"  value="1" id="reqPage">
                <input type="text" name="search" placeholder=" 상품명 검색" style="width:130px; height: 30px; font-size: 10pt; margin-left: 1px; padding: 0; vertical-align: middle;">
                <input type="submit" class="material-icons searchBtn" value="search" style="font-size: 18px; height: 30px; vertical-align: middle;">
            </form>
            </div>
            <div class="col-md-2 bootcol one" style="vertical-align: middle;  padding: 0;">
            	<c:if test="${sessionScope.m != null }">
               		<a href="/usedEnroll.do"><input type="button" value="물품등록" style="font-size: 16px; height: 30px; font-size: 14px; margin-left: 100px; width: 100px;" class="searchBtn"></a>
                </c:if>
            </div>
        </div>
    <section class="section-mid-size">
				<c:if test="${empty list }">
				<div style="height: 50px;"></div>
				<div style="margin-left: 500px; margin-top: 20px;">
					<h4>검색 결과가 없습니다.</h4>
				</div>
            	</c:if>
        <c:forEach items="${list }" var="c">
        <div class="prd-item">
            <div style="height: 250px; width: 250px; border: 1px solid #e0e0e0;">
                <a href="/usedDatail.do?usedNo=${c.usedNo }">
                <c:choose>
                <c:when test="${c.file[0].filepath != null }">
                <img src="resources/upload/used/${c.file[0].filepath }">
                </c:when>
                	<c:otherwise>
                		<img src="resources/upload/common/imgNo.png">
                	</c:otherwise>
                </c:choose>
                </a>
            </div>
            <div style="text-align: center; margin-top: 10px;"><a href="/usedDatail.do?usedNo=${c.usedNo }" id="prd-item-click">${c.usedTitle }</a></div>
            <div style="text-align: center; font-weight: 600; font-size: 14px;"><a href="/usedDatail.do?usedNo=${c.usedNo }" id="prd-item-click">${c.usedPrice } 원</a></div>
        </div>
        </c:forEach>
    </section>
    <section class="container" style="height: 100px; margin-top: 50px; display: block;">
        <div class="items-navi">
			<div class="btn-group">${pageNavi }</div>
		</div>
    </section>
</section>
	<jsp:include page="/WEB-INF/views/used/usedChat.jsp"/>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
   	<script>
   /* 	$("#ware-select").change(function(){
   			var ware = $("#ware-select").val();

   		}); */
   	</script>
</body>
</html>