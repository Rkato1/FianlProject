<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

    * {
        font-family: 'Noto Sans KR';
    }

    .content-wrap {
        width: 1200px;
        margin: 0 auto;
        box-sizing: border-box;
    }

    .title-box {
        padding-top: 30px;
        padding-bottom: 30px;
    }

    .title-box>h2 {
        font-weight: bolder;
        padding-bottom: 5px;
    }

    .title-box>p {
        padding: 0;
        margin: 0;
        color: dimgray;
        font-size: 15px;
    }
    
    
    .title-box>p:first-child {
    	color: dimgray;
    }
    
    .title-box>p:last-child {
    	color: #f49b00;
    }
    
    /*--------------------------------*/
   
    .list-box {
    	margin-top: 30px;
        margin-bottom: 30px;
	}
    
    
    .list-header {
        padding-top: 10px;
    	padding-bottom: 10px;
    	border-top: 2px solid #383a3f;
    	border-bottom: 2px solid #383a3f;
	}

	.list-header>span:first-child {
    	padding-left: 25px;
    	font-size: 16px;
    	font-weight: bolder;
	}

	.list-header>span:last-child {
    	padding-left: 500px;
    	font-size: 16px;
    	font-weight: bolder;
	}
	
	.list-body {
		overflow: hidden;
		border-bottom: 2px solid #383a3f;
	}

	.list-body ul {
    	list-style: none;
    	margin: 0;
    	padding: 0;
	}

	.list-body li {
    	list-style: none;
    	float: left;
    	width: 100%;
    	border-bottom: 1px solid #f2f2f2;
    	padding: 10px;
	}

	.list-body a {
    	color: black;
    	text-decoration: none;
    	font-size: 16px;
    	padding-left: 25px;
	}

	.list-body a:hover {
		color : #f49b00;
	    text-decoration: none;
    	font-size: 16px;
    	padding-left: 25px;
    	font-weight: bolder;
	}

	#no {
    	font-size: 16px;
    	padding-left: 15px;
	}

	#date {
    	font-size: 14px;
    	color: #c8c8c8;
    	padding-left: 20px;
	}
	
	.list_sub {
		background-color: #f2f2f2;
	}
	
	.list_sub>div {
		padding: 10px;
		padding-top: 30px;
		padding-bottom: 30px;
	}
	
	/*--------------------------------*/
	
	.pagenavi-box {
    	width: 1200px;
    	padding-top: 30px;
    	padding-bottom: 50px;
    	text-align: center;
    }
    
    
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
    <div class="content-wrap">
    
		<div class="title-box">
            <h2>공지사항</h2>
            <p>CAC의 새로운 소식들과 유용한 정보를 확인해보세요.</p>
            <p>※ 1월 공지사항 업데이트 되었습니다. </p>
        </div>

		<div class="list-box">
			<div class="list-header">
				<span>번호</span><span>제목 / 일자</span>
			</div>
			<div class="list-body">
				<ul>
				<c:forEach items="${notiList }" var="n">
					<li class="list_main">
						<span id="no">${n.noticeNo }</span>
						<a href="javascript:void(0)" class="list_main-a">${n.noticeTitle }</a>
						<span id="date">${n.noticeDate }</span>
					</li>
					<li class="list_sub" style="display: none">
						<div>${n.noticeContentBr }</div>
					</li>
				</c:forEach>
					<li class="list_main">
						<span id="no">474</span>
						<a href="javascript:void(0)" class="list_main-a">현금 거래 유도 및 계약 위반 캠핑장 탈퇴 조치 합니다!</a>
						<span id="date">2020.10.23</span>
					</li>
					<li class="list_sub" style="display: none">
						<div>
							현금 결제 유도 (무통장 수기 예약 금지)<br>
							무통장 수기 예약은 예약 중복이 발생 할 수 있는 예약 사고 유발 행위로 중대 위반 사항입니다.<br>
							캠핑장 홍보 및 예약 프로그램을 지원하여 예약 고객을 보내주고 있는데 카드 결제 완료 이후,<br>
							캠핑장에 이미 예약금까지 지급 된 예약 완료 건을  사용자에게 카드 결제를 취소하고 현금 결제 유도하는 행위는 계약 위반에 해당합니다.<br>
							예약은 약속이고 서로간의 신뢰입니다!
						</div>
					</li>
					<li class="list_main">
						<span id="no">475</span>
						<a href="javascript:void(0)" class="list_main-a"> 
							업무시간 / 문의방법 - 예약 / 환불 / 이용 문의건은 해당 캠핑장에 문의 바랍니다.
						</a>
						<span id="date">2020.10.27</span>
					</li>
					<li class="list_sub" style="display: none">
						<div>
							서버 유지 비용을 위해 일부 예약 수수료만 받고 캠핑장 예약 시스템만을 제공하는 사이트입니다.<br>
							사용자 상담은 캠핑장에서 잔담하며, 원할한 예약 관리를 위해 업무 협조 부탁 드립니다!<br>
							예약 / 환불 / 이용 문의건은 해당 캠핑장에 문의 바랍니다.<br>
						</div>
					</li>
				</ul>
			</div>

			<div class="pagenavi-box">
        		<div class="pageNavi">${pageNavi }</div>
        	</div>
		</div><!-- list-box -->
    </div><!-- content-wrap -->
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	<script>
	
        //게시물 클릭 시 상세내용 보여주는 이벤트
        $(".list_main-a").click(function() {
        	//클릭 했던 게시글 외에 다른 게시글을 눌렀을 때 나머지 게시물은 닫아주기
        	$(".list_sub").not($(this).parent().next(".list_sub")).slideUp();
			$(this).parent(".list_main").next(".list_sub").slideToggle();
        });

    </script>

</body>
</html>