function Search(){
	var where = $("#where").val();
	var checkIn = $("#checkIn").val();
	var checkOut = $("#checkOut").val();
	console.log(where);
	console.log(checkIn);
	console.log(checkOut);
	location.href="/searchCampListTest.do?reqPage=1&";
}