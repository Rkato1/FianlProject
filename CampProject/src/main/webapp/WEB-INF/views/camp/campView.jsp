<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- calendar CSS파일 호출 -->
<link href="../css/calendar/fullcalendar.min.css" type="text/css"
	rel="stylesheet">
<link href="../css/calendar/main.css" type="text/css" rel="stylesheet">

<!-- campView CSS파일 호출 -->
<link href="../css/camp/campView.css" type="text/css" rel="stylesheet" />
<!-- jQuery 호출 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>camp 상세보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>캠핑장 이미지</h4>
				<hr>
				<div id="demo" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<c:forEach var="i" begin="0" end="${camp.pictureList.size()-1}">
							<c:choose>
								<c:when test="i==0">
									<li data-target="#demo" data-slide-to="${i }" class="active"></li>
								</c:when>
								<c:otherwise>
									<li data-target="#demo" data-slide-to="${i }"></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
					<div class="carousel-inner">
						<c:set var="idx" value="0" />
						<c:forEach items="${camp.pictureList }" var="sub">
							<c:choose>
								<c:when test="idx==0">
									<div class="carousel-item active">
								</c:when>
								<c:otherwise>
									<div class="carousel-item">
								</c:otherwise>
							</c:choose>
							<img src="resources/upload/camp/${sub.filepath }"
								style="height: 400px;">
					</div>
					<c:set var="idx" value="1" />
					</c:forEach>
					<div class="carousel-item active">
						<img src="resources/upload/camp/camping_1.jpg"
							style="height: 400px;">
					</div>
					<div class="carousel-item">
						<img src="resources/upload/camp/camping_2.jpg"
							style="height: 400px;">
					</div>
					<div class="carousel-item">
						<img src="resources/upload/camp/camping_3.jpg"
							style="height: 400px;">
					</div>
				</div>
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</div>
	</div>
	<br>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>달력 이미지</h4>
				<hr>
				<div id="calendar" style="width: 100%;"></div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>캠핑장 배치도</h4>
				<hr>
				<c:choose>
					<c:when test="${camp.layoutList.size() == 0 }">
						<img src="resources/upload/camp/layout_01.jpg"
							style="width: 100%; height: 400px;">
					</c:when>
					<c:otherwise>
						<img src="resources/upload/camp/${camp.layoutList[0].filepath }"
							style="width: 100%; height: 400px;">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>공지사항</h4>
				<hr>
				<div id="line-wrapper">
					<ul class="nav-menu">
						<c:if test="${noticeList.size()==0 }">
							<h5>등록된 공지사항이 없습니다.</h5>
							<br>
						</c:if>
						<c:set var="idx" value="1" />
						<c:forEach items="${noticeList }" var="n">
							<li class="parent"><span>${idx}. ${n.campNoticeTitle}</span>
								<button class="nav-chevron"></button>
								<ul>
									<li>${n.campNoticeContent }</li>
								</ul> <c:set var="idx" value="${idx+1 }" /></li>
						</c:forEach>
						<c:if test="${noticeList.size() > 5 }">
							<li class="parent"><span>페이지 번호</span>
								<button class="nav-chevron"></button>
								<ul>
									<li>${pageNavi }</li>
								</ul></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="items">
			<div class="item">
				<h4>오시는 길</h4>
				<hr>
				<h3>주소 : ${camp.campAddr }</h3>
				<!-- 지도를 표시할 div 입니다 -->
				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
		</div>
	</div>
	<!-- 카카오 지도 API 호출 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef86e3cd225d33d28097d509c357ae61"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.533807, 126.896772), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var iwContent = '<div style="padding:5px;">'+${camp.campName}+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.533807, 126.896772), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성하고 지도에 표시합니다
var infowindow = new kakao.maps.InfoWindow({
    map: map, // 인포윈도우가 표시될 지도
    position : iwPosition, 
    content : iwContent,
    removable : iwRemoveable
});
      
// 아래 코드는 인포윈도우를 지도에서 제거합니다
// infowindow.close();   
	</script>
	<!-- campView js파일 호출 -->
	<script src="../js/camp/campView.js"></script>
	<!-- calendar js파일 호출 -->
	<script src="../js/calendar/jquery.min.js"></script>
	<script src="../js/calendar/moment.min.js"></script>
	<script src="../js/calendar/fullcalendar.min.js"></script>
	<script src="../js/calendar/ko.js"></script>
	<script>
		var draggedEventIsAllDay;
		var activeInactiveWeekends = true;
		var calendar = $('#calendar').fullCalendar({
			 events: [${events }],
			 locale                    : 'ko',    
			 timezone                  : "local", 
			 nextDayThreshold          : "09:00:00",
			 allDaySlot                : true,
			 displayEventTime          : true,
			 displayEventEnd           : true,
			 firstDay                  : 0, //월요일이 먼저 오게 하려면 1
			 weekNumbers               : false,
			 selectable                : true,
			 weekNumberCalculation     : "ISO",
			 eventLimit                : true,
			 views                     : { month : { eventLimit : 12 }},
			 eventLimitClick           : 'week', //popover
			 navLinks                  : true,
			 defaultDate               : moment('2021-01'), //실제 사용시 현재 날짜로 수정
			 timeFormat                : 'HH:mm',
			 defaultTimedEventDuration : '01:00:00',
			 editable                  : false,
			 minTime                   : '00:00:00',
			 maxTime                   : '24:00:00',
			 slotLabelFormat           : 'HH:mm',
			 weekends                  : true,
			 nowIndicator              : true,
			 dayPopoverFormat          : 'MM/DD dddd',
			 longPressDelay            : 0,
			 eventLongPressDelay       : 0,
			 selectLongPressDelay      : 0,
			 header                    : {
				 left   : 'today, prevYear, nextYear, viewWeekends',
                 center : 'prev, title, next',
                 right  : 'month, agendaWeek, agendaDay, listWeek'
			 },
			 
			 views                     : {
                 month : {
                   columnFormat : 'dddd'
                 },
                 agendaWeek : {
                   columnFormat : 'M/D ddd',
                   titleFormat  : 'YYYY년 M월 D일',
                   eventLimit   : false
                 },
                 agendaDay : {
                   columnFormat : 'dddd',
                   eventLimit   : false
                 },
                 listWeek : {
                   columnFormat : ''
                 }
    			 },
    		customButtons             : {
    			viewWeekends : {
    				text  : '주말',
                    click : function () {
                      activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                      $('#calendar').fullCalendar('option', { 
                        weekends: activeInactiveWeekends
                      });
                    }
    			}
    		}
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>