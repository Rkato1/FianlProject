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
	//이부분에서 거르기
	<c:choose>
		<c:when test="${option eq 'reviewPoint' }">
			var chart = new CanvasJS.Chart("chartContainer", {
				theme: "dark2", // "light1", "light2", "dark1"
				animationEnabled: true,
				title: {
					fontFamily: "jua",
					text: "평점"
				},
				axisX: {
					labelFontFamily: "jua",
					titleFontFamily: "jua"
				},
				axisY: {
					labelFontFamily: "jua",
					titleFontFamily: "jua",
					title: "평점 (3위까지)",
					includeZero: true,
					maximum:5,
					suffix: " 점"
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
		</c:when>
		
		<c:when test="${option eq 'sales' }">
			var chart = new CanvasJS.Chart("chartContainer", {
				theme: "dark2", // "light1", "light2", "dark1"
				animationEnabled: true,
				title: {
					fontFamily: "jua",
					text: "총 매출"
				},
				axisX: {
					labelFontFamily: "jua",
					titleFontFamily: "jua"
				},
				axisY: {
					labelFontFamily: "jua",
					titleFontFamily: "jua",
					title: "총 매출 (3위까지)",
					includeZero: true,
					suffix: " 원"
				},
				toolTip: {
					fontFamily: "jua",
					content: "{label} : {y}"
				},
				data: [{
					type: "column",
					yValueFormatString: "#,##0 원",
					indexLabel: "{y}",
					dataPoints: dps[0]
				}]
			});
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	
	
	 
	var yValue;
	var label;
	 
	<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
		<c:forEach items="${dataPoints}" var="dataPoint">			
			yValue = parseFloat("${dataPoint.y}");
			<c:if test="${dataPoint.y} eq 0">
				yValue = parseFloat("0");
			</c:if>
			label = "${dataPoint.label}";
			dps[parseInt("${loop.index}")].push({
				label : label,
				y : yValue
			});
		</c:forEach>	
	</c:forEach> 
	 
	chart.render();
}
	function setValues(){
		var option = $("#option option:selected").val();
		console.log(option);
		location.href="/admin/greatcampAdmin.do?option="+option;		
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
	                <select id="option">
				   		<option value="reviewPoint">평점</option>
				   		<option value="sales">매출</option>
				   	</select>
				   	<button id="okBtn" onclick="setValues()">조회</button>
                   	<p class="title">우수캠핑장선정</p>
                   	<div id="chartContainer" style="height: 65%; width: 100%;"></div>
                   	<!-- div id="chartContainer" style="height: 65%; width: 100%;"></div-->
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                </div>
            </div>
        </div>

    </div> 
</body>
</html>