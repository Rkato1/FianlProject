function Search(){
	var where = $("#where").val();
	var checkIn = $("#checkIn").val();
	var checkOut = $("#checkOut").val();
	console.log(where);
	console.log(checkIn);
	console.log(checkOut);
	location.href="/searchCampListTest.do?reqPage=1&value="+where+"&startDate="+checkIn+"&endDate="+checkOut;
}

$("#checkIn").change(function(){
	var checkIn = $("#checkIn").val();
	var checkOutTag = $("#checkOut");
	checkOutTag.attr('min',checkIn+1);
	console.log(checkOut);
});