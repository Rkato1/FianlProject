<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑후기 | 작성하기</title>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- ckeditor -->
<script type="text/javascript" src="../js/ckeditor/ckeditor.js" ></script>

    <style>
        * {
            font-family: 'Noto Sans KR';
            box-sizing: border-box;
        }

        .content-wrap {
            width: 1000px;
            margin: 0 auto;
        }

        .review-title {
            padding-top: 30px;
            padding-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 2px solid #383a3f;
        }
        
        .review-title-text {
        	font-weight: bolder;
        }

        .review-button {
            text-align: center;
            padding-top: 30px;
            padding-bottom: 30px;
        }

        #writeBtn {
            background-color: #f49b00;
            color: white;
            width: 100px;
        }

        input[name='memberId'] {
            width: 200px;
        }
        
        input[name='reserveNo'] {
            width: 200px;
            margin-right: 10px;
            display: inline-block;
        }
        
        #star {
        	color: #ffd56b;
        }
        
        /*------------------------------*/
            
        
        #required {
        	color: #f49b00;
        }
        
        #point-value {
        	color: dimgray;
        	font-size: 13px;
        }
        
        /*-------------------------------*/
        
        .form-control:focus {
			border-color: #ced4da !important;
        	outline: 0 none !important;
        	box-shadow: none !important;
        }
        
        .btn:focus {
        	outline: 0 none !important;
        	box-shadow: none !important;
        }
        
	</style>
	
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div class="content-wrap">
        <div class="review-title">
            <h2 class="review-title-text">후기작성하기</h2>
        </div>
        <div class="review-table">
            
            <!-- 예약번호 검색하는 form -->
            <form name="searchReserve">
                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
            </form>
            
            <form action="/insertReview.do" method="post" enctype="multipart/form-data">
                <table class="table table-bordered">
                    <tr>
                        <td>제목<span id="required">*</span></td>
                        <td><input type="text" name="reviewTitle" id="reviewTitle" value="" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>
                        	<input type="text" name="memberId" value="${sessionScope.m.memberId }" class="form-control" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>예약번호<span id="required">*</span></td>
                        <td>
                        	<input type="text" value="" name="reserveNo" id="reserveNo" class="form-control" readonly>
                        	<button type="button" class="btn btn-secondary" onclick="search();">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>별점<span id="required">*</span></td>
                        <td>
                        	<input type="hidden" value="" name="reviewPoint" id="reviewPoint" class="point">
                        	<i class="far fa-star point-mark" id="star"></i> 
                        	<i class="far fa-star point-mark" id="star"></i> 
                        	<i class="far fa-star point-mark" id="star"></i> 
                        	<i class="far fa-star point-mark" id="star"></i> 
                        	<i class="far fa-star point-mark" id="star"></i> 
                        	<span id="point-value">&ensp;별점을 선택하여 평가해주세요</span>
                        </td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td><input type="file" name="files" id="isFile" accept="image/*" multiple></td>
                    </tr>
                    <tr>
                        <td>내용<span id="required">*</span></td>
                        <td>
                        	<textarea style="resize: none;" rows="20" cols="50" name="reviewContent" id="reviewContent" class="form-control"></textarea>
                        </td>
                    </tr>
                </table>
                <div class="review-button">
                    <button type="submit" class="btn" id="writeBtn">작성완료</button>
                </div>
            </form>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
	<script>
		$(function() {
	        //Submit 버튼
	        $("#writeBtn").click(function(event) {	        	
	        	var reviewTitle = $("#reviewTitle").val();
	        	var reserveNo = $("#reserveNo").val();
	        	var reviewPoint = $("#reviewPoint").val();
	        	var reviewContent = $("#reviewContent").val();
	        	var reviewContentCk = CKEDITOR.instances.reviewContent.getData();
	        	
	        	if(reviewTitle == "" || reserveNo == "" || reviewPoint == "" || reviewContentCk == "") {
	                alert("*는 필수 입력 항목입니다.");
	                event.preventDefault();
	        	} else {
		    		//이미지 파일만 등록가능하도록 유효성 검사
		    		var imgFile = $('#isFile').val();
		    		var fileForm = /(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$/;
		    		
		    		if(imgFile != "") {
		    		    if(!imgFile.match(fileForm)) {
		    		    	alert("이미지 파일만 업로드 가능합니다.");
		    		    	event.preventDefault();
		    		    }
		    		}
	        	}
	        })
		 });
		
        //예약번호 검색 팝업창
        function search() {
            var url = "/searchReserve.do"; //서블릿 url mapping 값
            var title = "searchReserve";
            var status = "left=400px, top=400px, width=500px, height=300px, menubar=no, status=no, scrollbars=yes";
            //비어있는 창 열어주기
            var popup = window.open("", title, status);

         	//숨겨둔 form name으로 가져오기
            var searchFrm = $("[name=searchReserve]");

            //popup창 - form태그 연결
            //target속성 : a태그에서  _blank로 하면 새창에서 열림
            searchFrm.attr("target", title);
            searchFrm.attr("action", url);
            searchFrm.submit();
        }
        
		//별 클릭하면 채워진 별 이미지로 변경하는 이벤트
		//한번만 클릭되고 다음부터는 안되는 문제가 있었음
		//-> $(document).on 페이지가 로드 될때 계속 새로운 클래스로 생성
		$(document).on("click", ".point-mark", function() {
			mark = $(".point-mark");
			idx = $(".point-mark").index(this);
			mark.removeClass("fas fa-star");
			mark.removeClass("far fa-star");
			mark.each(function(index, item) {
				if (index <= idx) {
					$(item).addClass("fas fa-star");
				} else {
					$(item).addClass("far fa-star");
				}
			});
			//input val에 숫자로 값 넣어주기
			$(".point").val((idx + 1));
			console.log($(".point").val());
		});

		//id가 reviewContent인 태그에 ckeditor를 적용시킴
		//이미지 업로드 불가
		CKEDITOR.replace('reviewContent', {
			height: 500
		});
		
    </script>
    
</body>
</html>