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
						<c:forEach items="${noticeList }" var="n">
							<li class="parent">
							<span>${n.campNoticeTitle}</span>
							<button class="nav-chevron"></button>
							<ul>
								<li>${n.campNoticeContent }</li>
							</ul>
						</li>
						</c:forEach>
						<li class="parent">
							<span>공지사항1</span>
							<button class="nav-chevron"></button>
							<ul>
								<li>가나다</li>
								<li>abcd</li>
							</ul>
						</li>
						
						<li class="parent">
							<span>공지사항2</span>
							<button class="nav-chevron"></button>
							<ul>
								<li>123</li>
								<li>456</li>
							</ul>
						</li>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef86e3cd225d33d28097d509c357ae61"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.533807,126.896772), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
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