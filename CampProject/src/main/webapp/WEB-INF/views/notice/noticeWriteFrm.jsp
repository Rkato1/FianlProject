<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">


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
            
		.form-control:focus {
			border-color: #ced4da !important;
        	outline: 0 none !important;
        	box-shadow: none !important;
        }
	</style>
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div class="content-wrap">
        <div class="review-title">
            <h2 class="review-title-text">공지사항 작성하기</h2>
        </div>
        <div class="review-table">       
            <form action="/noticeInsert.do" method="post" enctype="multipart/form-data">
                <table class="table table-bordered">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="noticeTitle" value="" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>
                        	<input type="text" name="memberId" value="${sessionScope.m.memberId }" class="form-control" readonly>
                        </td>
                    </tr>                              
                    <tr>
                        <td>첨부파일</td>
                        <td><input type="file" name="files" multiple></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td><textarea rows="20" cols="50" name="noticeContent" id="noticeContent" class="form-control"></textarea></td>
                    </tr>
                </table>
                <div class="review-button">
                    <input type="submit" value="작성완료" class="btn" id="writeBtn">
                </div>
            </form>
        </div>
    </div>
    
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
</body>
</html>