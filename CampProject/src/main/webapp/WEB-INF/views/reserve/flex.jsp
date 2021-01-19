<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 호출 -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" name="reserveNo" class="numbers" value="13"><br>
	<input type="text" name="reserveNo" class="numbers" value="14"><br>
	<input type="text" name="reserveNo" class="numbers" value="15"><br>
	<input type="text" name="reserveNo" class="numbers" value="16"><br>
	<input type="text" name="reserveNo" class="numbers" value="17"><br>
	<script>
	 $(function(){
		 var numbers = new Array();
		 $(".numbers").each(function(idx, item) {
			var number = $(".numbers").eq(idx).val();
            var result = String(number);
            numbers[idx] = result;
            console.log("number = "+number);
		 });
		console.log("numbers = "+numbers)
	 });
	</script>
</body>
</html>