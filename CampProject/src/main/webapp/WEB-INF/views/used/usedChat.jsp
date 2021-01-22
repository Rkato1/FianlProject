<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Compiled and minified CSS -->

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>

	
	#container {
		width: 600px;
		height: 530px;
		background: #eff3f7;
		font-size: 0;
		border-radius: 5px;
		overflow: hidden;
		position: fixed;
		right: 0;
		bottom:0;
		z-index:10000;
		margin-right: 40px;
		margin-bottom: 130px;
	}
	
	#aside1 {
		width: 200px;
		height: 530px;
		background-color: #fa9b00;
		display: inline-block;
		font-size: 15px;
		vertical-align: top;
		margin: 0;
	}
	
	#main1 {
		width: 400px;
		height: 500px;
		display: inline-block;
		font-size: 15px;
		vertical-align: top;
	}
	
	#aside1 header {
		padding: 30px 20px;
	}
	
	#aside1 input {
		width: 100%;
		height: 50px;
		line-height: 50px;
		padding: 0 50px 0 20px;
		background-color: #fa9b00;
		border: none;
		border-radius: 3px;
		color: #fff;
		background-image:
			url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
		background-repeat: no-repeat;
		background-position: 170px;
		background-size: 40px;
	}
	
	#aside1 input::placeholder {
		color: #fff;
	}
	
	#aside1 ul {
		padding-left: 0;
		margin: 0;
		list-style-type: none;
		overflow-y: scroll;
		height: 530px;
	}
	
	#aside1 li {
		padding: 10px 0;
	}
	
	#aside1 li:hover {
		background-color: #ffcc47;
	}
	
	h2, h3 {
		margin: 0;
	}
	
	#aside1 li img {
		border-radius: 50%;
		margin-left: 20px;
		margin-right: 8px;
	}
	
	#aside1 li div {
		display: inline-block;
		vertical-align: top;
		margin-top: 12px;
	}
	
	#aside1 li h2 {
		font-size: 14px;
		color: #fff;
		font-weight: normal;
		margin-bottom: 5px;
	}
	
	#aside1 li h3 {
		font-size: 12px;
		color: #7e818a;
		font-weight: normal;
	}
	
	.status {
		width: 8px;
		height: 8px;
		border-radius: 50%;
		display: inline-block;
		margin-right: 7px;
	}
	
	.orange {
		background-color: #ff725d;
	}
	
	.blue {
		margin-right: 0;
		margin-left: 7px;
	}
	
	#main1 header {
		height: 110px;
		padding: 30px 20px 30px 40px;
	}
	
	#main1 header>* {
		display: inline-block;
		vertical-align: top;
	}
	
	#main1 header img:first-child {
		border-radius: 50%;
	}
	
	#main1 header img:last-child {
		width: 24px;
		margin-top: 8px;
	}
	
	#main1 header div {
		margin-left: 10px;
		margin-right: 145px;
	}
	
	#main1 header h2 {
		font-size: 16px;
		margin-bottom: 5px;
	}
	
	#main1 header h3 {
		font-size: 14px;
		font-weight: normal;
		color: #7e818a;
	}
	
	#chat {
		margin: 0;
		padding: 0;
		list-style-type: none;
		overflow-y: scroll;
		height: 300px;
		border-top: 2px solid #fff;
		border-bottom: 2px solid #fff;
	}
	
	#chat li {
		padding: 10px 30px;
	}
	
	#chat h2, #chat h3 {
		display: inline-block;
		font-size: 13px;
		font-weight: normal;
	}
	
	#chat h3 {
		color: #bbb;
	}
	
	#chat .entete {
		margin-bottom: 5px;
	}
	
	#chat .message {
		padding: 20px;
		color: #fff;
		line-height: 25px;
		max-width: 90%;
		display: inline-block;
		text-align: left;
		border-radius: 5px;
	}
	
	#chat .me {
		text-align: right;
	}
	
	#chat .you .message {
		background-color: #58b666;
	}
	
	#chat .me .message {
		background-color: #fa9b00;
	}
	
	#chat .triangle {
		width: 0;
		height: 0;
		border-style: solid;
		border-width: 0 10px 10px 10px;
	}
	

	
	#main1 footer {
		height: 80px;
		padding: 20px 30px 10px 20px;
	}
	
	#main1 footer textarea {
		background-color : white;
		resize: none;
		border: none;
		display: block;
		width: 100%;
		height: 60px;
		border-radius: 3px;
		padding: 20px;
		font-size: 13px;
		margin-bottom: 4px;
	}
	
	#main1 footer textarea::placeholder {
		color: #ddd;
	}
	
	#main1 footer img {
		height: 30px;
		cursor: pointer;
	}
	
	#main1 footer a {
		text-decoration: none;
		text-transform: uppercase;
		font-weight: bold;
		color: #6fbced;
		vertical-align: top;
		margin-left: 333px;
		margin-top: 5px;
		display: inline-block;
	}
	
	  #floatMenu {
		position: fixed;
		right: 0;
		bottom:0;
		z-index:10000;
		margin-right: 40px;
		margin-bottom: 40px;
		}
</style>
</head>
<body>
<c:if test="${sessionScope.m != null }">
<div id="container" style="display: none;">
		<div id="aside1">
			<ul style="padding: 0; cursor: pointer;" id="chatRoom">
				<%-- <li>
					<div style="margin-left: 20px;">
						<h2>${room.receiver }님과 대화방</h2>
						<h3>
							<span class="status green"></span>
							
						</h3>
					</div>
				</li> --%>
			</ul>
		</div>
        <div id="main1" style="float: left;">
            <header id="headChat">
                <!-- <div>
                    <h3>alreadyㅁㄴㅇㅁㄴㅇ 1902 messages</h3>
                </div> -->
            </header>
            <ul id="chat">
            </ul>
            <footer>
            	<input type="hidden" value="${u.usedWriter }" name="umReceiver" />
                <textarea placeholder="메세지를 입력하세요!" name="message"></textarea>
                <button style="margin-left: 295px; color: #fa9b00; border: none; background-color: none;" onclick="insertUm('${sessionScope.m.memberId}')">보내기</button>
            </footer>
        </div>
    </div>
        <a class="btn-floating btn-large waves-effect waves-light red" id="floatMenu">
        <i class="material-icons" id="chat-icon"style="background-color: #fa9b00; width: 65px; height: 65px; border-radius: 50px; 
        text-align: center; line-height: 65px; font-size: 40px; pointer-events: none; color: white;" onclick="">format_quote</i>
        </a>
        </c:if>
	<script>
		//메세지 내용 검사
		function selectMessage(umsc){
			console.log(umsc);
			$.ajax({
				url : "/selectMessage.do",
	            type : "POST",
	            data : {umReceiver:umsc},
	            success : function(data){
	            	$("#chat").html("");
	            	$("#headChat").html("");
	            	console.log(data);
	            	var session = '${sessionScope.m.memberId}';
	            	//채팅방 제목
	            	var title = "";
	            	title += "<div>";
	            	title += "<h3 style='font-size: 16px; color: #fa9b00; font-weight:700;'>"+umsc+"님과 대화방입니다.<h3>";
	            	title += "</div>";
	            	$("#headChat").append(title);
	            	//메세지부분
	            	var mes = "";
	            	for(var i =0; i<data.length; i++){
	            		if(data[i].umSender != (session)){
	            			mes += "<li class='you'>";
	            			mes += "<div class='entete'>";
	            			mes += "<h2>"+data[i].umSender+"</h2>";
	            			mes += "<h3>"+data[i].umDate+"<h3>";
	            			mes += "</div>";
	            			mes += "<div class='message'>"+data[i].message+"</div>";
	            			mes += "</li>";
	            		}else{
	            			mes += "<li class='me'>";
	            			mes += "<div class='entete'>";
	            			mes += "<h2>"+data[i].umSender+"</h2>";
	            			mes += "<h3>"+data[i].umDate+"<h3>";
	            			mes += "</div>";
	            			mes += "<div class='message'>"+data[i].message+"</div>";
	            			mes += "</li>";
	            	}
	            }
	            		$("#chat").append(mes);
	            		$("#chat").scrollTop($("#chat")[0].scrollHeight);
			}
		});
	};
	
	

		//메세지 보내기
		function insertUm(umSender){
			var umReceiver = $("[name=umReceiver]").val();
			var message = $("[name=message]").val();
			console.log(umReceiver);
			console.log(message);
			console.log(umSender);
			 $.ajax({
				url : "/insertUm.do",
				data : {umReceiver:umReceiver, umSender:umSender, message:message},
				type : "post",
				success : function(data){
					if(data == 1){
						alert("쪽지보내기 성공");
						sendMsg(umReceiver);
						location.reload();
					}else{
						alert("쪽지보내기 실패");
					}
				}
			});
		}
		
		
		
		
		
		var ws;
		var memberId = '${sessionScope.m.memberId}';
		function connect(){
			ws = new WebSocket("ws://192.168.219.105/umCount.do");
			ws.onopen = onOpen;
			ws.onmessage = onMessage;
			ws.onclose = onClose;
		}
		function onOpen() {
			console.log("접속 성공");
			var msg = {
					type : "register",
					data : memberId
			}
			//send 발신
			ws.send(JSON.stringify(msg));
			sendMsg(memberId);
		}
		function onMessage(e) {
			var count = e.data;
			$("#dmCount").html(count);
		}
		function onClose() {
			console.log("접속 종료");
		}
		//receiver	수신
		function sendMsg(receiver){
			var msg = {
					type : "count",
					data : receiver //받는사람 ㅋㅋㅋ
			}
			ws.send(JSON.stringify(msg));
		}
		//연결
		$(function(){
			connect();
		});
		
		
		
		
	 $(function(){
			stickyFooter();
			$(window).scroll(stickyFooter).resize(stickyFooter);
		});
		function stickyFooter(){
			document_height = $(document).height(); // 문서. 전체 높이
			document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
			window_height = $(window).height(); // 창 높이
			footer_height = $("#floatMenu").height();

			gap = document_height - footer_height - window_height; 
			bottom = document_scrollTop - gap ; 

			if(document_scrollTop > gap){
				$("#floatMenu").css("bottom", bottom+"px");
			}else{
				$("#floatMenu").css("bottom","0");
			}
		}
		
	 $(function(){
			stickyFooter2();

			$(window).scroll(stickyFooter).resize(stickyFooter);
		});
		function stickyFooter2(){
			document_height = $(document).height(); // 문서. 전체 높이
			document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
			window_height = $(window).height(); // 창 높이
			footer_height = $(".container").height();

			gap = document_height - footer_height - window_height; 
			bottom = document_scrollTop - gap ; 

			if(document_scrollTop > gap){
				$(".container").css("bottom", bottom+"px");
			}else{
				$(".container").css("bottom","0");
			}
		}
		
		
		$("#floatMenu").click(function(){ 
			if($("#container").css('display') == "none"){
				$("#chat-icon").css('transition','all ease 0.5s');
				$("#chat-icon").css('-webkit-transform',' rotate(45deg)');
				$("#container").show();
			}else{
				$("#chat-icon").css('transition','all ease 0.5s');
				$("#chat-icon").css('-webkit-transform',' rotate(0deg)');
				$("#container").hide();
			}
		});
		
		/* $("#chatRoom>li").click(function(){ 
			if($("#chatRoom").css('display') != "none"){
				$("#main1").show();
			}else{
				$("#main1").hide();
			}
		}); */
	</script>
</body>
</html>