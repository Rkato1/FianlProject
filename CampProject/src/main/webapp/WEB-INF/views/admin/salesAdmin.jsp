<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리 페이지</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/admin/admin.css">
<script src="/js/admin/admin.js"></script>
<script type="text/javascript">
window.onload = function() {
var f = new FontFace('jua', 'url(/css/admin/BMJUA_ttf.ttf)'); 
var dps = [[]];
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "dark1", // "light1", "dark1", "dark2"
	animationEnabled: true,
	title: {
		fontFamily: "jua",
		text: "차트 제목 적는곳"
	},
	axisX: {
		//글자 포맷
		//valueFormatString: "MMM"
		//valueFormatString: "string"		
		labelFontFamily: "jua",
		titleFontFamily: "jua",
		valueFormatString: "# 월"
	},
	axisY: {
		labelFontFamily: "jua",
		titleFontFamily: "jua",
		title: "y축 제목",
		includeZero: true,
		suffix: " 단위"
	},
	toolTip: {
		fontFamily: "jua",
		content: "{x} : {y}"
	},
	//legend항목 넣어서 어떤색이 뭔지 표시할수도있음
	data: [{
		//차트의 종류
		type: "line",
		//x축 값의 형식
		//xValueType: "dateTime",
		//x축 값의 글자 포맷(hover시 보여주기)
		//xValueFormatString: "MMM",
		xValueFormatString: "#,##0 월",
		//y축 값의 글자 포맷(hover시 보여주기)
		yValueFormatString: "#,##0 단위",
		dataPoints: dps[0]
	}]
});

var xValue;
var yValue;
 
<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
	<c:forEach items="${dataPoints}" var="dataPoint">
		xValue = parseInt("${dataPoint.x}");
		yValue = parseFloat("${dataPoint.y}");
		dps[parseInt("${loop.index}")].push({
			x : xValue,
			y : yValue
		});
	</c:forEach>	
</c:forEach> 

chart.render();

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
                    <p class="title">매출관련정보</p>
                    <div id="chartContainer" style="height: 65%; width: 100%;"></div>
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> 
                </div>
            </div>
        </div>

    </div> 
</body>
</html>