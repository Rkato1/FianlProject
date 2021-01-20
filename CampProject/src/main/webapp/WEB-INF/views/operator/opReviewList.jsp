<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opReviewList.css" type="text/css" rel="stylesheet">

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
                        <a href="/opCampView.do?campNo=${camp.campNo}"><li>캠핑장소개</li></a>
                        <a href="/opCampSite.do?campNo=${camp.campNo }"><li>구역 안내</li></a>
                    </ul>
                    <a href="/opReservation.do"><li>예약현황</li></a>
                    <a href="/opNoticeList.do?campNo=${camp.campNo}&reqPage=1"><li>공지사항</li></a>
                    <a href="/opReviewList.do?campNo=${camp.campNo }&reqPage=1"><li style="border-bottom: 4px solid rgb(250,220,0);">리뷰관리</li></a>
                </ul>
            </div>
            <div class="content">
		        <table class="table table-striped" style="width: 100%; text-align: center;">
		            <thead>
		            	<tr>
		                	<th class="th-1">번호</th>
		                	<th class="th-3">제목</th>
		                	<th class="th-4">별점</th>
		                	<th class="th-5">작성자</th>
		                	<th class="th-6">작성일</th>
		            	</tr>
		            </thead>
		            <tbody>
		            	<c:if test="${empty list }">
		            	<tr>
		            		<td colspan="6" style="text-align:center;">
		            			검색하신 캠핑장에 대한 조회 결과가 존재하지 않습니다.
		            		</td>
		            	</tr>	
		            	</c:if>
		            	<c:forEach items="${list }" var="r" varStatus="status">
		            	<tr>
		                	<td>${status.count }</td>
		                	<td>
		                		<a id="review-a" href="/opReviewView.do?reviewNo=${r.reviewNo }&campNo=${r.campNo }">
		                			${r.reviewTitle }
		                		</a>
		                	</td>
		                	<td class="point">
		                		<c:forEach var="i" begin="0" end="4">
		                			<c:choose>
		                				<c:when test="${r.reviewPoint  > i }">
		                					<i class="fas fa-star"></i>
		                				</c:when>
		                				<c:otherwise>
		                					<i class="far fa-star"></i>
		                				</c:otherwise>
		                			</c:choose>
		                		</c:forEach>
		                	</td>
		                	<td>${r.memberId }</td>
		                	<td>${r.reviewDate }</td>
		            	</tr>
		            	</c:forEach>
		            </tbody>
		        </table>
		
				<div class="pageNaviBox">
		        	<div class="pageNavi">${pageNavi }</div>
		        </div>
    		</div>
    	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	 <script>
     	$('#menu>ul>li').click(function(){
     		$(this).next().slideToggle();
     	})
     
     </script>
</body>
</html>