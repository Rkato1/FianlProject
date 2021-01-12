<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
	</style>
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div class="content-wrap">
        <div class="review-title">
            <h2 class="review-title-text">리뷰작성하기</h2>
        </div>
        <div class="review-table">
            
            <!-- 예약번호 검색하는 form -->
            <form name="searchReserve">
                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
            </form>
            
            <form action="/insertReview.do" method="post" enctype="multipart/form-data">
                <table class="table table-bordered">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="reviewTitle" value="" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>
                        	<input type="text" name="memberId" value="${sessionScope.m.memberId }" class="form-control" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>예약번호</td>
                        <td>
                        	<input type="text" value="" name="reserveNo" id="reserveNo" class="form-control" readonly>
                        	<button type="button" class="btn btn-secondary" onclick="search();">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td><input type="file" name="filename"></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td><textarea rows="20" cols="50" name="reviewContent" id="reviewContent" class="form-control"></textarea></td>
                    </tr>
                </table>
                <div class="review-button">
                    <input type="submit" value="글쓰기" class="btn" id="writeBtn">
                </div>
            </form>
        </div>
    </div>
    
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
   <script>
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
    </script>
   
</body>
</html>