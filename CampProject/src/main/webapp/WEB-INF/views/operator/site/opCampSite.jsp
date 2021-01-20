<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opCampSite.css" type="text/css" rel="stylesheet">
<link href="../css/operator/btn.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/operator/opHeader.jsp"/>
	<section>
		<div> <!-- 섹션아래 div -->
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
                        <a href="/opCampView.do?campNo=${camp.campNo}"><li>캠핑장소개</li></a>
                        <a href="/opCampSite.do?campNo=${camp.campNo }"><li style="border-bottom: 4px solid rgb(250,220,0);">구역 안내</li></a>
                    </ul>
                    <a href="/opReservation.do"><li>예약현황</li></a>
                    <a href="/opNoticeList.do?campNo=${camp.campNo}&reqPage=1"><li>공지사항</li></a>
                    <a href="/opReviewList.do?campNo=${camp.campNo }&reqPage=1"><li>리뷰관리</li></a>
                </ul>
            </div>
			<div class="content">
				<h4>시설 배치도</h4>
				<hr>
				<div>
					<div class="GuideImg">
							<c:forEach items="${camp.pictureList }" var="p" varStatus="status">
			                	<c:if test="${p.fileGrade==3 }">
			                		<c:set var="picture" value="${p}"/>
			                	</c:if>
		                	</c:forEach>
						
	                	<c:choose>
		                	<c:when test="${picture != null }">
		                		<div class="img-wrapper"><img src="/resources/upload/camp/${picture.filename}"/></div>
		                		<button class="btn-update" onclick="location.href='/opCampSitePictureUpdate.do?campNo=${picture.pictNo}'">사진 수정</button>
		                	</c:when>
		                	<c:otherwise>
		                		<div>
			                		<div style="height: 100px;line-height: 100px;">캠핑장에 대한 시설 배치도가 존재하지 않습니다.</div>
			                		<button class="btn-update" onclick="location.href='/opCampSitePicture.do?campNo=${camp.campNo}'">사진 등록</button>
			                	</div>
		                	</c:otherwise>
	                	</c:choose>
					</div>					
				</div>
				<br><br><br>
				<h4>사이트(구역) 목록</h4>
				<hr>

				<c:if test="${empty categorys}">
					<div style="height: 100px;line-height: 100px;">캠핑장의 사이트가 존재하지 않습니다.</div>
				</c:if>
				<c:forEach items="${categorys }" var="category">
				
				<h5 style="margin-top:30px;">${category }</h5>
				<div class="site-name-page">
				<table class="table" style="text-align: center;">
					<tr>
						<th style="width:10%">번호</th>
						<th style="width:25%">사이트 이름</th>
						<th style="width:15%">비수기</th>
						<th style="width:15%">성수기</th>
						<th style="width:15%">극성수기</th>
						<th style="width:20%;"></th>
					</tr>
				</table>
					<ul>
						<c:forEach items="${siteList}" var="sList" varStatus="s">
						<c:if test="${category eq sList.siteTitle }">
						<li>
							<div class="tbl-wrapper">
								<table class="tbl" style="height: 50px;">
									<tr>
										<td style="width:10%">${s.count }</td>
										<td style="width:25%">${sList.siteName }</td>
										<td style="width:15%">${sList.lowDayPay }원~</td>
										<td style="width:15%">${sList.peakDayPay}원~</td>
										<td style="width:15%">${sList.polarDayPay}원~</td>
										<td style="width:20%">
											<button class="btn"><a href="/siteUpdateForm.do?campNo=${camp.campNo }&siteNo=${sList.siteNo }">수정</a></button>
											<button class="btn"><a href="/deleteSite.do?campNo=${camp.campNo }&siteNo=${sList.siteNo }">삭제</a></button>
										</td>
									</tr>
								</table>
							</div>
						</li>
						</c:if>
						</c:forEach>
					</ul>
				</div>
				</c:forEach>
				<div class="btn-wrapper">
					<button class="btn-update" onclick="location.href='/opCampSiteForm.do?campNo=${camp.campNo}'">등록하기</button>
				</div>
			</div>
		</div><!-- 섹션아래 div -->
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(".ul-toggler").click(function(){
			$(this).next().slideToggle();
		});
		$('#menu>ul>li').click(function(){
     		$(this).next().slideToggle();
     	});
	</script>
</body>
</html>