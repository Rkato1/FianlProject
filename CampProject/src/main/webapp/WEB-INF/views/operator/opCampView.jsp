<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opCampView.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp"/>
	<section>
        <div>
        	<div><a href="/operatorpage.do">목록으로</a></div>
        	<hr>
            <div>
                <h2>${camp.campName }</h2>
            </div>
            <hr>
            <div id="menu">
                <ul>
                    <li style="border-bottom: 4px solid rgb(250,220,0);">캠핑장정보</li>
                    <ul>
                        <a href="/opCampView.do?campNo=${camp.campNo}"><li style="border-bottom: 4px solid rgb(250,220,0);">캠핑장소개</li></a>
                        <a href="/opCampSite.do?campNo=${camp.campNo }"><li>구역 안내</li></a>
                    </ul>
                    <a href="/opReservation.do"><li>예약현황</li></a>
                    <a href="/opNoticeList.do?campNo=${camp.campNo}&reqPage=1"><li>공지사항</li></a>
                    <a href="/opReviewList.do?campNo=${camp.campNo }&reqPage=1"><li>리뷰관리</li></a>
                </ul>
            </div>
            <div class="content">
             <h4>캠핑장 기본정보</h4>
            	<div id="main_img">
	            	<div class="img-wrapper" style="width:100%;height:100%;">
						<c:forEach items="${camp.pictureList }" var="p">
		                	<c:if test="${p.fileGrade==1 }">
		                		<img src="/resources/upload/camp/${ p.filename}"/>
		                	</c:if>
	                	</c:forEach>
	                </div>
                </div>
                <div>
                	<table class="camp_info">
	                     <tr>
	                    	<th><span class="title">캠핑장 주소</span></th>
	                    	<td><span>${camp.campAddr }</span></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">캠핑장 유형</span></th>
	                    	<td><span>${camp.campType }</span></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">문의처</span></th>
	                    	<td><span>${camp.campPh }</span></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">운영기간</span></th>
	                    	<td><span>${camp.campPeriod }</span></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">운영일</span></th>
	                    	<td><span>${camp.campDay }</span></td>
	                    </tr>
	                    <tr>
	                    	<th><span class="title">이용 가능시설</span></th>
	                    	<td><span>${camp.campFacility }</span></td>
	                    </tr>
                    </table>
                </div>
                <h4 style="margin-top:200px;">소개 이미지</h4>
                <div class="info_imgs">
	                <c:forEach items="${camp.pictureList }" var="p">
	                	<c:if test="${p.fileGrade==2 }">
	                		<div class="img-wrapper"><img src="/resources/upload/camp/${p.filename} "></div>
	                	</c:if>
	                </c:forEach>
                </div>
                <h4>캠핑장 소개</h4>
                <div id="campShow">${camp.campShow }</div>
                <br>
                <br>
                <br>
                <div style="text-align: center;">
                	<button class="updateBtn" onclick="location.href='/opCampUpdateForm.do?campNo=${camp.campNo}'">수정하기</button>
                </div>
            </div>
        </div>
     </section>
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
     <script>
     	$('#menu>ul>li').click(function(){
     		$(this).next().slideToggle();
     	})
     
     </script>
</body>
</html>