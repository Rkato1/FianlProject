<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li style="border-bottom: 4px solid rgb(250, 220, 0);">캠핑장정보</li>
					<ul>
						<a href="/opCampView.do?campNo=${camp.campNo}">
							<li style="border-bottom: 4px solid rgb(250, 220, 0);">캠핑장소개</li>
						</a>
						<a href="/opCampSite"><li>구역 안내</li></a>
					</ul>
					<a href="/opReservation.do"><li>예약현황</li></a>
					<a href="opNoticeList.do?campNo=${camp.campNo}"><li>공지사항</li></a>
					<a href="/opReview.do"><li>리뷰관리</li></a>
				</ul>
			</div>
			<div class="content">
				<h4>공지사항</h4>
				<div class="inputBar">
					<c:if test="${sessionScope.m.memberNo == camp.memberNo }">
						<div class="writeBox">
							<button type="button" class="btn" id="writeBtn">
								<a href="/opNoticeForm.do">글쓰기</a>
							</button>
						</div>
					</c:if>
				</div>

				<table style="width: 100%; text-align: center;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="n" varStatus="status">
							<tr>
								<td>${status.index }</td>
								<td><a
									href="/noticeView.do?noticeNo=${n.campNoticeNo }&campNo=${n.campNo }">
										${n.campNoticeTitle } </a></td>
								<td>${n.campNoticeDate }</td>
								<td><a
									href="/deleteCampNotice.do?campNoticeNo=${campNoticeNo }">삭제<a></td>
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
</body>
</html>