<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<!-- Google Fonts-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Font Awesome-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!-- BOOTETRAP -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>공지사항</title>
   <style>
      * {
         font-family: 'Noto Sans KR';
         box-sizing: border-box;
      }

      .content-wrap {
         width: 1200px;
         margin: 0 auto;
         margin-top: 150px;
         margin-bottom: 150px;
      }
      
      /*----------------------------------*/

      .review-title>h2 {
         font-weight: bolder;
         padding-bottom: 20px;
         border-bottom: 2px solid #383a3f;
      }
      
      /*----------------------------------*/

      .review-info {
         overflow: hidden;
      }

      .review-user {
         float: right;
      }

      .review-button {
         float: right;
      }

      #updateBtn,
      #deleteBtn {
         text-decoration: none;
         color: white;
         outline: none;
      }

      .review-user {
         padding: 8px 20px 0px 0px;
         /*위 오 아래 왼*/
      }
      
      /*----------------------------------*/

      .camp-info {
         border-top: 2px solid #d3d3d3;
         border-bottom: 2px solid #d3d3d3;
         margin: 70px 0px 70px 0px;
         /*위 오 아래 왼*/
         padding: 15px;
      }

      .review-point {
         width: 162px;
         border-radius: 8px;
      }

      #star {
         color: #ffd56b;
         font-size: 1.2em;
      }

      .camp-name {
         font-size: 1.1em;
         font-weight: bolder;
      }

      .camp-addr {
         color: #848484;
      }

      .camp-link>a {
         text-decoration: none;
         color: #f49b00;
         font-size: 1.1em;
      }

      .camp-link>a:hover {
         text-decoration: none;
         color: #f49b00;
         font-weight: bolder;
         font-size: 1.1em;
      }
      
      /*----------------------------------*/

      .review-content {
         padding: 15px;
      }
      
      .review-content-text {
      	margin-top: 30px;
      }

      .commnet-wrap {
         border-top: 2px solid #383a3f;
         margin-top: 50px;
         padding-top: 20px;
      }

      .comment-cnt {
         color: #f49b00;
         font-weight: bolder;
         font-size: 1.1em;
      }

      .comment-write {
         background-color: #FAFAFA;
         margin-top: 20px;
         padding: 20px 0px 20px 30px;
         /*위 오 아래 왼*/
      }

      .comment-write>form>textarea, .comment-change {
         width: 1050px;
         vertical-align: middle;
         outline: none;
         resize: none;
         border: 1px solid #d3d3d3;
      }

      #commentWriteBtn {
         width: 80px;
         height: 80px;
         color: white;
         background-color: #f49b00;
      }

      .comment-list {
         margin-top: 30px;
      }
      
      .comment-one {
         margin: 30px;
         overflow: hidden;
      }

      .comment-info {
         overflow: hidden;
      }

      .comment-img {
         width: 40px;
         height: 40px;
         float: left;
         border-radius: 70%;
         overflow: hidden;
      }

      .comment-img>img {
         width: 100%;
         height: 100%;
         object-fit: cover;
      }

      .comment-user {
         float: left;
         width: 200px;
         height: 40px;
         line-height: 50px;
         padding-left: 10px;
      }

      #comment-id {
         font-size: 1.1em;
         font-weight: bolder;
      }

      #comment-date {
         font-size: 0.8em;
         color: #848484;
      }
      
      .comment-link {
         width: 150px;
         height: 40px;
         line-height: 50px;
         float: left;
      }
      
      .comment-a {
         text-decoration: none;
         color: #383a3f;
      }
      
      .comment-a:hover {
         text-decoration: none;
         font-weight: bolder;
         color: #383a3f;
      }
      
      .comment-re {
         text-decoration: none;
         color: #f49b00;
      }
      
      .comment-re:hover {
         text-decoration: none;
         font-weight: bolder;
         color: #f49b00;
      }
      
      .comment-content {
         padding: 10px;
      }

      .comment-arrow {
         width: 80px;
         height: 60px;
         text-align: center;
         color: #6c757d;
         font-size: 25px;
         transform: rotate(180deg);
         float: left;
      }
      
      /*대댓글 창 생성*/
      .comment-re-write {
      	 background-color: #FAFAFA;
         margin-top: 20px;
         padding: 20px 0px 20px 30px;
         /*위 오 아래 왼*/
      }
      
      .comment-re-write>form>textarea {
         width: 820px;
         vertical-align: middle;
         outline: none;
         resize: none;
         border: 1px solid #d3d3d3;
      }

      #commentWriteBtn {
         width: 80px;
         height: 80px;
         color: white;
         background-color: #f49b00;
      }
      
      #commentCancelBtn {
      	 width: 80px;
         height: 80px;
         color: white;
         background-color: #383a3f;
      }
      
   </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="content-wrap">
      <div class="review-title">
         <h2>${n.noticeTitle }</h2>
      </div>
      <div class="review-info">
      	 <c:if test="${sessionScope.m.memberId.equals(n.noticeWriter) }"><!-- 로그인 한 회원과 글 작성자가 같을 때 -->
         <div class="review-button">
            <button type="button" class="btn btn-secondary">
               <a id="updateBtn" href="/noticeUpdateForm.do?noticeNo=${n.noticeNo }">수정</a>
            </button>
            <button type="button" class="btn btn-secondary">
               <a id="deleteBtn" href="javascript:void(0)" onclick="noticeDelete('${n.noticeNo }')">삭제</a>
            </button>
         </div>
         </c:if><!-- 로그인 한 회원과 리뷰 작성자가 같을 때 -->
         <div class="review-user">
            <span>${n.noticeWriter }</span>
            <span>&nbsp;｜&nbsp;</span>
            <span>${n.noticeDate }</span>
         </div>
      </div>
      
      <div class="review-content">
      	<c:if test="${!empty n.fileList }">
      	<div class="review-content-img">
      		<c:forEach items="${n.fileList }" var="f">
      			<img src = "resources/upload/notice/${f.filepath }" width="700px">
      		</c:forEach>
		</div>
		</c:if>
		<div class="review-content-text">
			${n.noticeContentBr }
		</div>
      </div>
      <div class="commnet-wrap">
         <div class="comment-list" style="text-align:center;">
				<button onclick="backList(${reqPage})">목록으로 돌아가기</button>
            </div><!-- comment-list  -->
       </div><!-- commnet-wrap -->
   </div><!-- content-wrap -->
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	
	//공지사항 삭제 버튼 클릭 했을 때
	function noticeDelete(noticeNo) {
		if(confirm("삭제한 글은 복구되지 않습니다. 삭제하시겠습니까?")) {
			location.href="/noticeDelete.do?noticeNo="+noticeNo;
		}
	}
	
	function backList(reqPage){
		location.href="/noticeList.do?reqPage="+reqPage;
	}
	
	</script>
	
</body>
</html>