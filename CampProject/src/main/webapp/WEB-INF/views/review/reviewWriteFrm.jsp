<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
            width: 300px;
        }
        
        input[name='reserveNo'] {
            width: 300px;
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
            <form name="searchRevFrm">
                <input type="hidden" name="memberNo">
            </form>
            <form action="" method="post">
                <table class="table table-bordered">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="reviewTitle" value="" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td><input type="text" name="memberId" value="happy369" class="form-control" readonly></td>
                    </tr>
                    <tr>
                        <td>예약번호</td>
                        <td><input type="text" value="" name="reserveNo" class="form-control" readonly><button type="button" class="btn btn-secondary" onclick="search();">검색</button></td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td><input type="file" name="filename"></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td><textarea rows="20" cols="50" name="content" class="form-control"></textarea></td>
                    </tr>
                </table>
                <div class="review-button">
                    <input type="submit" value="글쓰기" class="btn" id="writeBtn">
                </div>
            </form>
        </div>
    </div>
    
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
</body>
</html>