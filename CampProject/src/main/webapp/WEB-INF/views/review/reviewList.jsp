<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    * {
        font-family: 'Noto Sans KR';
    }

    .content-wrap {
        width: 1200px;
        margin: 0 auto;
        box-sizing: border-box;
    }

    .titleBox {
        padding-top: 30px;
        padding-bottom: 30px;
    }

    .titleBox>h2 {
        font-weight: bolder;
        padding-bottom: 5px;
    }

    .titleBox>p {
        padding: 0;
        margin: 0;
        color: dimgray;
        font-size: 15px;
    }

    /*--------------------------------*/

    .inputBar {
        overflow: hidden;
        padding-top: 30px;
    }

    .searchBox {
        float: right;
        width: 350px;
        padding-bottom: 10px;
    }

    #searchInput,
    #searchBtn {
        outline: none;
        box-shadow: none;
    }

    .writeBox {
        float: right;
        margin-left: 10px;
        color: white;
    }

    #writeBtn {
        background-color: #f49b00;
    }

    #writeBtn>a {
        text-decoration: none;
        color: white;
    }

    input:focus {
        outline: none;
    }

    /*--------------------------------*/

    /*표 너비 설정*/
    .th-1 {
        width: 7%;
    }

    .th-2 {
        width: 23%;
    }

    .th-3 {
        width: 30%;
    }

    .th-4 {
        width: 13%;
    }

    .th-5 {
        width: 17%;
    }

    .th-6 {
        width: 10%;
    }

    .select>a {
        text-decoration: none;
        color: #383a3f;
    }

    .select>a:hover {
        color: #f49b00;
    }

    .score>i {
        color: #ffd56b;
    }

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	    <div class="content-wrap">

        <div class="titleBox">
            <h2>캠핑 후기</h2>
            <p>많은 사람들이 공유할 수 있도록 자유롭고 솔직한 후기를 남겨주세요.</p>
            <p>※ 욕설이나 비방글은 동의없이 삭제될 수 있습니다.</p>
        </div>

        <div class="inputBar">
            <div class="writeBox">
                <button type="button" class="btn" id="writeBtn">
                    <a href="/reviewWriteFrm.do">글쓰기</a>
                </button>
            </div>

            <form action="/searchKeyword">
                <div class="searchBox">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" id="searchInput">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary" id="searchBtn">캠핑장 검색</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <table class="table table-striped" style="width: 100%; text-align: center;">
            <thead>
            	<tr>
                	<th class="th-1">번호</th>
                	<th class="th-2">캠핑장</th>
                	<th class="th-3">제목</th>
                	<th class="th-4">별점</th>
                	<th class="th-5">작성자</th>
                	<th class="th-6">작성일</th>
            	</tr>
            </thead>
            <tbody>
           		<tr>
              		<td>1</td>
                	<td>청량산 나무네 숲 캠핑장</td>
                	<td class="select"><a href="#">힐링하고 왔어요</a></td>
                	<td class="score">
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                	</td>
                	<td>happy369</td>
                	<td>2020.12.30</td>
            	</tr>
            	<tr>
                	<td>1</td>
                	<td>청량산 나무네 숲 캠핑장</td>
                	<td class="select"><a href="#">힐링하고 왔어요</a></td>
                	<td class="score">
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                    	<i class="fas fa-star"></i>
                	</td>
                	<td>happy369</td>
                	<td>2020.12.30</td>
            	</tr>
            </tbody>
        </table>

        <div id="pageNavi"></div>
    </div>
    
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>