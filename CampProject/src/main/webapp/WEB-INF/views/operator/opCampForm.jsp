<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp"/>
	<section>
        <div>
            <div>
                <h2>${camp.campName }</h2>
            </div>
            <hr>
		<div id="menu">
                <ul>
                    <li style="border-bottom: 4px solid rgb(250,220,0);">캠핑장정보</li>
                    <ul>
                        <a href="/opCampView.do?campNo=${camp.campNo}"><li style="border-bottom: 4px solid rgb(250,220,0);">캠핑장소개</li></a>
                        <a href="/opCampSite"><li>이용 안내</li></a>
                    </ul>
                    <li></li>
                    <ul></ul>
                    <a href="/opReservation.do"><li>예약현황</li></a>
                    <a href="/opNoticeList.do"><li>공지사항</li></a>
                    <a href="/opReview.do"><li>리뷰관리</li></a>
                </ul>
        </div>
        <div class="content">
         <h4>캠핑장 사이트</h4>
            	<div id="main_img" class="img-wrapper">
	            	<div class="img-wrapper">
						<c:forEach items="${camp.pictureList }" var="p">
		                	<c:if test="${p.fileGrade==1 }">
		                		<img src="/resources/upload/camp/${p.filepath} "/>
		                	</c:if>
	                	</c:forEach>
	                </div>
                </div>
                <div>
                	<table class="site_info">
	                     <tr>
	                    	<th><span class="title">캠핑 사이트</span></th>
	                    	<td><span>${camp.campAddr }</span></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">캠핑 사이트</span></th>
	                    	<td><span>${camp.campType }</span></td>
	                    </tr>
                    </table>
                </div>
                <div>
                	<table class="site_info">
	                     <tr>
	                    	<th><span class="title">캠핑 사이트</span></th>
	                    	<td><span>${camp.campAddr }</span></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">캠핑 사이트</span></th>
	                    	<td><span>${camp.campType }</span></td>
	                    </tr>
                    </table>
                </div>
                <div>
                	<table class="site_info">
	                     <tr>
	                    	<th><span class="title">캠핑 사이트</span></th>
	                    	<td><span>${camp.campAddr }</span></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">캠핑 사이트</span></th>
	                    	<td><span>${camp.campType }</span></td>
	                    </tr>
                    </table>
                </div>
                <br>
                <h4>소개 이미지</h4>
                <div class="info_imgs">
	                <c:forEach items="${camp.pictureList }" var="p">
	                	<c:if test="${p.fileGrade==2 }">
	                		<div class="img-wrapper"><img src="/resources/upload/camp/${p.filepath} "></div>
	                	</c:if>
	                </c:forEach>
                </div>
                <h4>캠핑장 소개</h4>
                <div id="campShow">${camp.campShow }</div>
                <br>
                <br>
                <br>
                <div style="text-align: center;">
                	<button class="updateBtn">수정하기</button>
                </div>
            </div>
        </div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>