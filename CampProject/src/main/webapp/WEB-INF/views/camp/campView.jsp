<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- calendar CSS파일 호출 -->
<link href="/resources/css/calendar/fullcalendar.min.css"
	rel="stylesheet">
<link href="/resources/css/calendar/main.css" rel="stylesheet">
<!-- jQuery 호출 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>캠핑장 상세보기</title>
<!-- campView CSS파일 호출 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/camp/campView.css">
<style>
.carousel-inner
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content">
		<div class="items">
			<div class="item">
				<h4>${camp.campName }</h4>
				<hr>
				<c:choose>
					<c:when test="${camp.pictureList.size() > 0 }">
						<div id="demo" class="carousel slide" data-ride="carousel">
							<ul class="carousel-indicators">
								<c:set var="index" value="1" />
								<c:forEach var="i" begin="1" end="${camp.pictureList.size()}">
									<c:choose>
										<c:when test="${index ==1 }">
											<li data-target="#demo" data-slide-to="${i-1 }"
												class="active"></li>
											<c:set var="index" value="2" />
										</c:when>
										<c:otherwise>
											<li data-target="#demo" data-slide-to="${i-1 }"></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
							<c:set var="index" value="1" />
							<div class="carousel-inner">
								<c:forEach items="${camp.pictureList }" var="p">
									<c:choose>
										<c:when test="${index ==1 }">
											<div class="carousel-item active">
												<img src="/resources/upload/camp/${p.filepath }"
													style="height: 400px;">
											</div>
											<c:set var="index" value="2" />
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<img src="/resources/upload/camp/${p.filepath }"
													style="height: 400px;">
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="carousel-control-next-icon"></span>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<h5>등록된 상세 이미지가 없습니다.</h5>
						<br>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<br>
	<div class="content">
		<div class="items">
			<div class="item">
				<a name="target"><h4>달력 이미지</h4></a>
				<hr>
				<div id="calendar" style="width: 100%;"></div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="items">
			<div class="item">
				<h4>캠핑장 배치도</h4>
				<hr>
				<c:choose>
					<c:when test="${camp.layoutList.size() == 0 }">
						<img src="/resources/upload/camp/layout_01.jpg"
							style="width: 100%; height: 400px;">
					</c:when>
					<c:otherwise>
						<img src="/resources/upload/camp/${camp.layoutList[0].filepath }"
							style="width: 100%; height: 400px;">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="content">
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
	<div class="content">
		<div class="items">
			<div class="item">
				<h4>오시는 길</h4>
				<hr>
				<h3>주소 : ${camp.campAddr }</h3>
				<!-- 지도를 표시할 div 입니다 -->
				<input type="hidden" name="campName" id="campName" class="campName"
					value="${camp.campName }"> <input type="hidden"
					name="campAddr" id="campAddr" class="campAddr"
					value="${camp.campAddr }">
				<div id="map" style="width: 100%; height: 400px;"></div>
			</div>
		</div>
	</div>
	<!-- 카카오 지도 API 호출 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef86e3cd225d33d28097d509c357ae61&libraries=services"></script>
	<!-- campView js파일 호출 -->
	<script src="/js/camp/campView.js"></script>
	<!-- calendar js파일 호출 -->
	<script src="/js/calendar/jquery.min.js"></script>
	<script src="/js/calendar/moment.min.js"></script>
	<script src="/js/calendar/fullcalendar.min.js"></script>
	<script src="/js/calendar/ko.js"></script>
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