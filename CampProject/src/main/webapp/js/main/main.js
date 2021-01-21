function Search() {
	var where = $("#where").val();
	var checkIn = $("#checkIn").val();
	var checkOut = $("#checkOut").val();
	console.log(where);
	console.log(checkIn);
	console.log(checkOut);
	location.href = "/searchCampListTest.do?reqPage=1&value=" + where
			+ "&startDate=" + checkIn + "&endDate=" + checkOut;
}

$("#checkIn").change(function() {
	var checkIn = $("#checkIn").val();
	var checkOutTag = $("#checkOut");
	checkOutTag.attr('min', checkIn + 1);
	//console.log(checkOut);
});

$(document).ready(function() {
	$.ajax({
		url : "/onload.do",
		type : "POST",
		success : function(data) {
			//결과 str을 div안에 넣는다
			$("#result").html(data);
			var cnt = -1;//0번방부터이기때문에 -1로 시작
			$(".dates").each(function(idx, item) {
				cnt++;//존재하면 0번부터 시작
			});

			var startDate = $(".dates").eq(0).val();//checkIn 시작일, 최소날짜
			var startDate1 = $(".dates").eq(1).val();//checkOut 시작일
			var endDate = $(".dates").eq(cnt).val(); //최대날짜 (cnt대입)

			$("#checkIn").val(startDate);
			$("#checkIn").attr("min", startDate);
			$("#checkIn").attr("max", endDate);

			$("#checkOut").val(startDate1);
			$("#checkOut").attr("min", startDate1);
			$("#checkOut").attr("max", endDate);
			
			oldChkIn = $("#checkIn").val();
			oldChkOut = $("#checkOut").val();
		}
	});
});
$("#checkIn").change(function() {
	 dateChk();
});
 $("#checkOut").change(function() {
	 dateChk();
 });

function dateChk() {
	var bool = true;
	var startVal = $("#checkIn").val(); //2021-01-21
	var startArr = startVal.split('-');

	var endVal = $("#checkOut").val(); //2021-01-20
	var endArr = endVal.split('-');

	var startDate = new Date(startArr[0], (parseInt(startArr[1]) - 1),
			startArr[2]);
	var endDate = new Date(endArr[0], (parseInt(endArr[1]) - 1),
			endArr[2]);

	if (startDate.getTime() > endDate.getTime()) {
		bool = false; //chkIn이 큰경우
	} else {
		bool = true;//chkIn이 작은경우
	}
	if(!bool){
		alert('해당 날짜는 선택할 수 없습니다.');
		$("#checkIn").val(oldChkIn); 
		$("#checkOut").val(oldChkOut); 
	}else{
		oldChkIn = startVal;
		oldChkOut = endVal;
	}   
}