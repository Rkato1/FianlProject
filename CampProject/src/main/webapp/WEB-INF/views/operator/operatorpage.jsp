<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/home.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	 <section>
        <div>
            <h2>캠핑장 관리</h2>
            <hr>
            <div id="campList">
            <c:forEach items="${campList }" var="c">
                <div class="camp_box">
            <a href="/opCampView.do?campNo=${c.campNo }">
                	<div class="img_wrapper">
                    	<img src="resources/upload/camp/${c.pictureList[0].filename }">
                    </div>
               		</a>
                    <div class="camp-name">
                    	<span style="padding: 2px;"><i class="fas fa-campground"></i></span>
                    	<span style="padding: 2px;">${c.campName }</span>
                    	<button class="deleteBtn" onclick="location.href='/deleteCamp.do?campNo=${c.campNo}'">
                    		<i class="fas fa-times"></i>
                    	</button>
                    </div>
                </div>
            
            </c:forEach>
            	<a href="/campForm.do">
                <div class="camp_box add_camp">
                    <div>+</div>
                </div>
                </a>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>