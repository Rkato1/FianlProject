<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>우수캠핑장선정 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<script type="text/javascript" src="/js/admin/admin.js"></script>
<script type="text/javascript">
window.onload = function() {
	var f = new FontFace('jua', 'url(/css/admin/BMJUA_ttf.ttf)');	 
	var dps = [[]];
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "dark2", // "light1", "light2", "dark1"
		animationEnabled: true,
		title: {
			fontFamily: "jua",
			text: "별점"
		},
		axisX: {
			labelFontFamily: "jua",
			titleFontFamily: "jua"
		},
		axisY: {
			labelFontFamily: "jua",
			titleFontFamily: "jua",
			title: "평점 (평균)",
			includeZero: true,
			maximum:5,
			suffix: "점"
		},
		toolTip: {
			fontFamily: "jua",
			content: "{label} : {y}"
		},
		data: [{
			type: "column",
			yValueFormatString: "#.# 점",
			indexLabel: "{y}",
			dataPoints: dps[0]
		}]
	});
	 
	var yValue;
	var label;
	 
	<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
		<c:forEach items="${dataPoints}" var="dataPoint">
			yValue = parseFloat("${dataPoint.y}");
			label = "${dataPoint.label}";
			dps[parseInt("${loop.index}")].push({
				label : label,
				y : yValue
			});
		</c:forEach>	
	</c:forEach> 
	 
	chart.render();
	
	//2는 총매출로 값 변경해서 적용하면 끝
	var chart2 = new CanvasJS.Chart("chartContainer2", {
		theme: "dark2", // "light1", "light2", "dark1"
		animationEnabled: true,
		title: {
			fontFamily: "jua",
			text: "총매출"
		},
		axisX: {
			labelFontFamily: "jua",
			titleFontFamily: "jua"
		},
		axisY: {
			labelFontFamily: "jua",
			titleFontFamily: "jua",
			title: "평점 (평균)",
			includeZero: true,
			maximum:5,
			suffix: "점"
		},
		toolTip: {
			fontFamily: "jua",
			content: "{label} : {y}"
		},
		data: [{
			type: "column",
			yValueFormatString: "#.# 점",
			indexLabel: "{y}",
			dataPoints: dps[0]
		}]
	});
	 
	var yValue;
	var label;
	 
	<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
		<c:forEach items="${dataPoints}" var="dataPoint">
			yValue = parseFloat("${dataPoint.y}");
			label = "${dataPoint.label}";
			dps[parseInt("${loop.index}")].push({
				label : label,
				y : yValue
			});
		</c:forEach>	
	</c:forEach> 
	 
	chart2.render();
	}
</script>
<body>
    <div class="admin-wrap">
        <!--화면 좌측-->
        <jsp:include page="sideMenu.jsp"/>
        <!--화면 우측-->
        <div class="admin-content">
            <div class="real-content">
                <div class="members">
                   	<p class="title">우수캠핑장선정</p>
                   	<div id="chartContainer" style="height: 32.5%; width: 100%;"></div>
                   	<div id="chartContainer2" style="height: 32.5%; width: 100%;"></div>
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                </div>
            </div>
        </div>

    </div> 
</body>
</html>