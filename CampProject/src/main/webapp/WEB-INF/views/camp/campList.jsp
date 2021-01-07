<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 호출 -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <!-- 글자 호출 검색 아이콘 -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<meta charset="UTF-8">
<title>캠핑장 리스트</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link href="../css/camp/campList.css" type="text/css" rel="stylesheet">
	<h1>캠핑장리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<th>캠핑장번호</th><th>캠핑장이름</th><th>캠핑장주소</th><th>사업자번호</th><th>캠핑장소개글</th><th>캠핑장유형</th><th>문의처</th>
			<th>운영기간</th><th>운영일</th><th>이용가능시설</th><th>평상시이용요금(주중)</th><th>평상시이용요금(주말)</th><th>성수기이용요금(주중)</th><th>성수기이용요금(주말)	</th>
		</tr>
		<c:forEach items="${list }" var="c">
			<tr>
				<td>${c.campNo }</td>
				<td>${c.campName }</td>
				<td>${c.campAddr }</td>
				<td>${c.memberNo }</td>
				<td>${c.campShow }</td>
				<td>${c.campType }</td>
				<td>${c.campPh }</td>
				<td>${c.campPeriod }</td>
				<td>${c.campDay }</td>
				<td>${c.campFacility }</td>
				<td>${c.campFeeOriDay }</td>
				<td>${c.campFeeOriEnd }</td>
				<td>${c.campFeePeakDay }</td>
				<td>${c.campFeePeakEnd }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/">메인으로 돌아가기</a>
	
	<div class="container">
        <div class="items-height">
            <div class="camp_search">
                <div class="input-group">
                    <select>
                        <option value="default" selected>--선택--</option>
                        <option value="name">이름으로 검색</option>
                        <option value="addr">주소로 검색</option>
                    </select>
                    <input type="text" class="form-control" placeholder="입력해주세요...">
                    <div class="input-group-append">
                        <button class="btn" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <br>
            <div class="items-width">
                <div class="item">
                    <a href="#">
                        <div class="item-top">
                            <div class="item-image">
                                <img src="camp_1.jpg">
                                최저 35,000 ~
                            </div>
                        </div>
                    </a>
                    <div class="item-bottom">
                        <div class="camp_name">(00)캠핑장</div>
                        <div class="camp_addr">(주소1)</div>
                        <button class="btn btn-outline-primary camp_button">상세보기</button>
                    </div>
                </div>
                <div class="item">
                    <a href="#">
                        <div class="item-top">
                            <div class="item-image">
                                <img src="camp_2.jpg">
                                최저 35,000 ~
                            </div>
                        </div>
                    </a>
                    <div class="item-bottom">
                        <div class="camp_name">(00)캠핑장</div>
                        <div class="camp_addr">(주소1)</div>
                        <button class="btn btn-outline-primary camp_button">상세보기</button>
                    </div>
                </div>
                <div class="item">
                    <a href="#">
                        <div class="item-top">
                            <div class="item-image">
                                <img src="camp_3.jpg">
                                최저 35,000 ~
                            </div>
                        </div>
                    </a>
                    <div class="item-bottom">
                        <div class="camp_name">(00)캠핑장</div>
                        <div class="camp_addr">(주소1)</div>
                        <button class="btn btn-outline-primary camp_button">상세보기</button>
                    </div>
                </div>
                <div class="item">
                    <a href="#">
                        <div class="item-top">
                            <div class="item-image">
                                <img src="camp_4.jpg">
                                최저 35,000 ~
                            </div>
                        </div>
                    </a>
                    <div class="item-bottom">
                        <div class="camp_name">(00)캠핑장</div>
                        <div class="camp_addr">(주소1)</div>
                        <button class="btn btn-outline-primary camp_button">상세보기</button>
                    </div>
                </div>
                <div class="item">
                    <a href="#">
                        <div class="item-top">
                            <div class="item-image">
                                <img src="camp_5.jpg">
                                최저 35,000 ~
                            </div>
                        </div>
                    </a>
                    <div class="item-bottom">
                        <div class="camp_name">(00)캠핑장</div>
                        <div class="camp_addr">(주소1)</div>
                        <button class="btn btn-outline-primary camp_button">상세보기</button>
                    </div>
                </div>
            </div>
            <div class="items-width">
                <div class="item">indigo</div>
                <div class="item">purple</div>
                <div class="item">red</div>
                <div class="item">orange</div>
                <div class="item">yellow</div>
            </div>
        </div>

    </div>
    <div class="container">
        <div class="items-navi">
            <div class="btn btn-outline-primary navi-btn">이전</div>
            <div class="btn btn-outline-primary navi-btn">1</div>
            <div class="btn btn-outline-primary navi-btn">2</div>
            <div class="btn btn-outline-primary navi-btn">3</div>
            <div class="btn btn-outline-primary navi-btn">4</div>
            <div class="btn btn-outline-primary navi-btn">5</div>
            <div class="btn btn-outline-primary navi-btn">다음</div>
        </div>
    </div>
</body>
</html>