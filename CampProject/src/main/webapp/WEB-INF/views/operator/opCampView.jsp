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
            <div>
                <h2>AAAA캠핑장</h2>
            </div>
            <hr>
            <div id="menu">
                <ul>
                    <a href="#"><li>캠핑장정보</li></a>
                    <ul>
                        <a href=""><li style="border-bottom: 4px solid rgb(250,220,0);">캠핑장소개</li></a>
                        <a href=""><li>이용 안내</li></a>
                    </ul>
                    <a href="#"><li>예약현황</li></a>
                    <a href="#"><li>공지사항</li></a>
                    <a href="#"><li>리뷰관리</li></a>
                </ul>
            </div>
            <div class="content">
            	<div id="main_img" class="img-wrapper">

                </div>
                <div>
                    <span class="title">캠핑장 이름</span>
                    <span>${camp.campName }</span><br>
                    <span class="title">캠핑장 주소</span>
                    <span>${camp.campAddr }</span><br>
                    <span class="title">캠핑장 유형</span>
                    <span>${camp.campType }</span><br>
                    <span class="title">문의처</span>
                    <span>${camp.campPh }</span><br>
                    <span class="title">운영기간</span>
                    <span>${camp.campPeriod }</span><br>
                    <span class="title">운영일</span>
                    <span>${camp.campDay }</span><br>
                    <span class="title">이용 가능시설</span>
                    <span>${camp.campFacility }</span><br>
                    <span class="title">이용 요금</span>
                    <table border=1 style="width: 51%;">
                        <tr>
                            <th></th>
                            <th>평상시</th>
                            <th>성수기</th>
                        </tr>
                        <tr>
                            <th>주중</th>
                            <td><span>${camp.campFeeOriDay~ }</span>원</td>
                            <td><span>${camp.campFeePeakDay~ }</span>원</td>
                        </tr>
                        <tr>
                            <th>주말</th>
                            <td><span>${camp.campFeeOriEnd~ }</span>원</td>
                            <td><span>${camp.campFeePeakEnd~ }</span>원</td>
                        </tr>
                    </table>
                </div>
                <h4>소개 이미지</h4>
                <c:forEach items="${camp.pictureList }" var="p">
                	<div class="img-wrapper"><img src="/resources/upload/camp/${p.filepath} "></div>
                </c:forEach>
                <h4>캠핑장 소개글</h4>
                <div id="campShow">${camp.campShow }</div>
            </div>
            </div>
        </div>
     </section>
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>