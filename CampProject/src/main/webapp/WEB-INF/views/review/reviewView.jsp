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
<title>Insert title here</title>
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
         margin: 60px 10px 60px 10px;
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

      .comment-write>form>textarea {
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
         width: 230px;
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
      
      .commonet-content {
         padding: 10px;
      }

      .comment-arrow {
         width: 80px;
         height: 80px;
         text-align: center;
         line-height: 50px;
         color: #6c757d;
         font-size: 25px;
         transform: rotate(180deg);
         float: left;
      }
   </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="content-wrap">
      <div class="review-title">
         <h2>${rev.reviewTitle }</h2>
      </div>
      <div class="review-info">
         <div class="review-button">
            <button type="button" class="btn btn-secondary">
               <a id="updateBtn" href="/reviewUpdate.do">수정</a>
            </button>
            <button type="button" class="btn btn-secondary">
               <a id="deleteBtn" href="/reviewDelete.do">삭제</a>
            </button>
         </div>
         <div class="review-user">
            <span>${rev.memberId }</span>
            <span>&nbsp;｜&nbsp;</span>
            <span>${rev.reviewDate }</span>
         </div>
      </div>
      <div class="camp-info">
         <div class="review-point">
         <c:forEach var="i" begin="0" end="4">
         	<c:choose>
				<c:when test="${rev.reviewPoint  > i }">
					<i class="fas fa-star" id=star></i>
				</c:when>
				<c:otherwise>
					<i class="far fa-star" id=star></i>
				</c:otherwise>
            </c:choose>
          </c:forEach>  
         </div><br>
         <div class="camp-name">${camp.campName }</div>
         <div class="camp-addr">${camp.campAddr }</div><br>
         <div class="camp-link"><a href="campView.do?campNo=${camp.campNo}">캠핑장 바로가기</a></div>
      </div>
      <div class="review-content">
         	충청남도 예산에 위치한 애견전용캠핑장에 다녀왔습니다.<br>
         	예약<br>
         	12월~3월은 장박 사이트 운영으로 인하여 문자 접수<br>
         	(피플앤독 네이버 카페 참고)<br>
         	사이트, 주차<br>
         	모든 사이트에 개별 울타리가 설치되어 있으며 사이트 크기에 따라 금액이 상이<br>
         	주차장에 주차 후 캠핑장에 비치되어 있는 리어카를 통해서 짐을 옮겨야 함<br>
         	짐을 끌고 캠핑장으로 들어가는 입구에 약간의 경사가 있음<br>
         	배전판<br>
        	 평균 두 사이트에 한 개씩 배전판 이용 가능<br>
         	부대시설<br>
         	샤워실 따뜻한 물 잘 나옴, 드라이기 비치<br>
        	 무인 매점 운영<br>
        	 와이파이 가능<br>
         	(여름) 애견 수영장 운영<br>
        	 규정이 많은 캠핑장이지만 그만큼 관리가 잘 되는 캠핑장이여서 좋은 곳입니다.<br>
        	 개별 울타리와 넓은 잔디(공용운동장)는 강아지를 키우는 애견 캠퍼라면 누구나 만족할만한 캠핑장이 아닐까 싶어요.<br>
      </div>
      <div class="commnet-wrap">
         <span class="comment-cnt">댓글 <span>${comCnt }</span>개</span>
         
         <!-- 로그인 안되어있으면, 댓글 등록창 안보이게 -->
         <c:if test="${sessionScope.m != null }">
         <div class="comment-write">
            <form>
               <input type="hidden" name="reviewCommnetLevel" value="1">
               <input type="hidden" name="reviewCommnetWriter" value="${sessionScope.m.memberId }">
               <input type="hidden" name="reviewNo" value="${rev.reviewNo }">
               <input type="hidden" name="reviewCommnetRef" value="0">	
               <textarea rows="3" cols="30" name="reviewContent"></textarea>
               <input type="submit" value="등록" class="btn" id="commentWriteBtn">
            </form>
         </div>
         </c:if>
         
         <div class="comment-list">
         	<c:forEach items="${comList }" var="rc">
         		<c:if test="${rc.reviewCommentLevel == 1 }">
            <div class="comment-one">
               <div class="comment-info">
                  <div class="comment-img">
                     <img src="resources/upload/common/user.png">
                  </div>
                  <div class="comment-user">
                     <span id="comment-id">${rc.reviewCommentWriter }</span>&nbsp;
                     <span id="comment-date">${rc.reviewCommentDate }</span>
                  </div>
                  <div class="comment-link">
                     <a class="comment-a" href="/revCommentUpdate.do">수정</a>&ensp;
                     <a class="comment-a" href="/revCommentDelete.do">삭제</a>&ensp;
                     <a class="comment-re" href="/revCommentDelete.do">답글달기</a>
                  </div>
               </div>
               <div class="commonet-content">${rc.reviewCommentContent }</div>
            </div>
            </c:if>
            </c:forEach>
            <div class="comment-one">
               <div class="comment-arrow">
                  <i class="fas fa-reply"></i>
               </div>
               <div class="comment-info">
                  <div class="comment-img">
                     <img src="resources/upload/common/user.png">
                  </div>
                  <div class="comment-user">
                     <span id="comment-id">user02</span>&nbsp;
                     <span id="comment-date">2021-01-02</span>
                  </div>
               </div>
               <div class="commonet-content">
                  짱 좋아
               </div>
            </div>
         </div>
      </div>
   </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>