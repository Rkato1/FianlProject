var campName = $("#campName").val();       
    var campAddr = $("#campAddr").val();
    var coordXY = document.getElementById("coordXY"); //검색 지도 경도위도 알아내기 
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스 
    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 위도경도 
        level: 3 //지도의 레벨(확대, 축소 정도) 
    };

    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴 

    // 지도타입 컨트롤, 줌 컨트롤 생성 
    var mapTypeControl = new kakao.maps.MapTypeControl();
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    //  주소-좌표 변환 객체를 생성 
    var geocoder = new kakao.maps.services.Geocoder();
    //  주소로 좌표를 검색 
    geocoder.addressSearch(campAddr, function(result, status) {
        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            yy = result[0].x;
            xx = result[0].y;
            // 결과값으로 받은 위치를 마커로 표시 
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            // 인포윈도우로 장소에 대한 설명을 표시 
            var iwContent = '<a href="#target">' +
                '<div style="padding:5px">' +
                campName +
                '</div>' +
                '</a>'

            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent
            });
            infowindow.open(map, marker);
            // 지도의 중심을 결과값으로 받은 위치로 이동
            map.setCenter(coords);
            //  resize 마커 중심 
            var markerPosition = marker.getPosition();
            $(window).on('resize', function() {
                map.relayout();
                map.setCenter(markerPosition);
            });
        } else {
            console.log('주소가 올바르지 못합니다.');
        }
    });
$(function() {
		$(".nav-chevron").next().hide();
});	
$('.nav-chevron').click(function() {
		$(this).next().toggle(400);
		$(this).toggleClass('transform');
})
