<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/menu_content.css" type="text/css"
	rel="stylesheet">
<link href="../css/operator/opNoticeList.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
		<div>
			<div>
				<h2>${camp.campName }</h2>
			</div>
			<hr>
			<div id="menu">
				<ul>
					<li>캠핑장정보</li>
					<ul>
						<a href="/opCampView.do?campNo=${camp.campNo}">
							<li>캠핑장소개</li>
						</a>
						<a href="/opCampSite"><li>구역 안내</li></a>
					</ul>
					<a href="/opReservation.do"><li>예약현황</li></a>
					<a href="opNoticeList.do?campNo=${camp.campNo}&reqPage=1" style="border-bottom: 4px solid rgb(250, 220, 0);"><li>공지사항</li></a>
					<a href="/opReview.do"><li>리뷰관리</li></a>
				</ul>
			</div>
			<div class="content">
				<h4>공지사항</h4>
				<div class="inputBar">
					<c:if test="${sessionScope.m.memberNo == camp.memberNo }">
						<div class="writeBox" style="margin:0 auto;width: 90%;text-align: right;">
							<button type="button" class="btn" id="writeBtn" >
								<a href="/campNoticeForm.do?campNo=${camp.campNo }">글쓰기</a>
							</button>
						</div>
					</c:if>
				</div>

				<table  class="table table-striped" style="width: 90%; text-align: center;margin:0 auto;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cnList }" var="n" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>
									<a href="/campNoticeView.do?campNoticeNo=${n.campNoticeNo }&campNo=${n.campNo }">
										${n.campNoticeTitle } </a>
								</td>
								<td>${n.campNoticeDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="pageNaviBox">
					<div class="pageNavi">${pageNavi }</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$('#menu>ul>li').click(function(){
	 		$(this).next().slideToggle();
	 	});
	</script>
</body>
</html>