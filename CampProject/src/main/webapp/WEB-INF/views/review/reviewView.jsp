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
<title>캠핑후기 | 상세보기</title>

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
      	 /*background-color: #f9f9f9;*/
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
      	margin-top: 80px;
      }
      
      .review-content-img-one {
      	width: 700px;
      	margin: 0 auto;
      	margin-top: 10px;
      	margin-bottom: 10px;
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
         <h2>${rev.reviewTitle }</h2>
      </div>
      <div class="review-info">
      	 <c:if test="${sessionScope.m.memberId.equals(rev.memberId) }"><!-- 로그인 한 회원과 리뷰 작성자가 같을 때 -->
         	<div class="review-button">
            	<button type="button" class="btn btn-secondary">
               		<a id="updateBtn" href="/reviewUpdateFrm.do?reviewNo=${rev.reviewNo }">수정</a>
            	</button>
            	<button type="button" class="btn btn-secondary">
               		<a id="deleteBtn" href="javascript:void(0)" onclick="deleteReview('${rev.reviewNo }')">삭제</a>
            	</button>
         	</div>
         </c:if><!-- 로그인 한 회원과 리뷰 작성자가 같을 때 -->
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
         <div class="camp-link"><a href="campView.do?campNo=${camp.campNo}&reqPage=1">캠핑장 바로가기</a></div>
      </div>
      <div class="review-content">
      	<c:if test="${!empty rev.fileList }"><!-- 첨부파일이 존재할 때 -->
      	<div class="review-content-img">
      		<c:forEach items="${rev.fileList }" var="f">
      			<div class="review-content-img-one">
      				<img src = "resources/upload/review/${f.filepath }" width="100%">   	
      			</div>
      		</c:forEach>
		</div>
		</c:if><!-- 첨부파일이 존재할 때 -->
		<div class="review-content-text">
			${rev.reviewContent }
		</div>
      </div>
      <div class="commnet-wrap">
         <span class="comment-cnt">댓글 <span>${comCnt }</span>개</span>
         
         <c:if test="${sessionScope.m != null }"><!-- 로그인 안되어있으면, 댓글 등록창 안보이게 -->
         <div class="comment-write">
            <form action="/insertReviewComment.do" method="post">
            	<input type="hidden" name="reviewCommentLevel" value="1">
            	<input type="hidden" name="reviewCommentWriter" value="${sessionScope.m.memberId }">
            	<input type="hidden" name="reviewNo" value="${rev.reviewNo }">
            	<input type="hidden" name="reviewCommentRef" value="0">	
            	<textarea rows="3" cols="30" name="reviewCommentContent" required></textarea>&nbsp;
            	<input type="submit" value="등록" class="btn" id="commentWriteBtn">
            </form>
         </div>
         </c:if><!-- 로그인 안되어있으면, 댓글 등록창 안보이게 -->
         
         <div class="comment-list">
         	<c:forEach items="${comList }" var="rc"><!-- 댓글 -->
         		<c:if test="${rc.reviewCommentLevel == 1 }"><!-- 원댓글인지 -->
            		<div class="comment-one">
               			<div class="comment-info">
                  			<div class="comment-img">
                  				<img src="resources/upload/common/user.png">
                  			</div>
                  			<div class="comment-user">
                     			<span id="comment-id">${rc.reviewCommentWriter }</span>&nbsp;
                     			<span id="comment-date">${rc.reviewCommentDate }</span>
                  			</div>
                  			
                  			<c:if test="${sessionScope.m != null }"><!-- 로그인이 되어있을 때 -->
                  			<div class="comment-link">
                  	 			<c:if test="${sessionScope.m.memberId.equals(rc.reviewCommentWriter) }"><!-- 로그인 한 회원과 댓글 작성자가 같을 때 -->
                     			<a class="comment-a" href="javascript:void(0)" onclick="modifyComment(this,'${rc.reviewCommentNo }','${rev.reviewNo }')">수정</a>&ensp;
                     			<a class="comment-a" href="javascript:void(0)" onclick="deleteComment(this,'${rc.reviewCommentNo }','${rev.reviewNo }')">삭제</a>&ensp;
                     			</c:if><!-- 로그인 한 회원과 댓글 작성자가 같을 때 -->
                     			<a class="comment-re recShow" href="javascript:void(0)" >답글달기</a>
                  			</div>
                  			</c:if><!-- 로그인이 되어있을 때 -->
                  		</div><!-- comment-info -->
                  		
                  		<!-- p태그는 조회 할때(Br사용) / textarea는 수정 할때 -->
                  		<div class="comment-content">
                  			<p>${rc.reviewCommentContentBr }</p>
                  			<textarea name="reviewCommentContent" class="comment-change" style="display:none;">${rc.reviewCommentContent }</textarea>
                  		</div>
                  		
                  		<!-- 답글 달기 창 숨겨두기 -->
                  		<div class="comment-re-write" style="display:none;">
                  		    <div class="comment-arrow">
                  				<i class="fas fa-reply"></i>
               				</div>
            				<form action="/insertReviewComment.do" method="post">
               					<input type="hidden" name="reviewCommentLevel" value="2">
              					<input type="hidden" name="reviewCommentWriter" value="${sessionScope.m.memberId }">
               					<input type="hidden" name="reviewNo" value="${rev.reviewNo }">
               					<input type="hidden" name="reviewCommentRef" value="${rc.reviewCommentNo }">	
               					<textarea rows="3" cols="30" name="reviewCommentContent" required></textarea>&nbsp;
               					<input type="submit" value="등록" class="btn" id="commentWriteBtn">
               					<input type="button" value="취소" class="btn recCancel" id="commentCancelBtn">
            				</form>
         		  		</div><!-- comment-write  -->
                  	</div><!-- comment-one -->
 
                  	<c:forEach items="${comList }" var="rcc"><!-- 댓글에 달린 대댓글 -->
                  		<c:if test="${rcc.reviewCommentLevel == 2 && rcc.reviewCommentRef == rc.reviewCommentNo }"><!-- 대댓글인지 && 해당하는 댓글번호의 대댓글인지 -->
                  			<div class="comment-one">
               					<div class="comment-arrow">
                  					<i class="fas fa-reply"></i>
               					</div>
               					<div class="comment-info">
                  					<div class="comment-img">
                     					<img src="resources/upload/common/user.png">
                  					</div>
                  					<div class="comment-user">
                     					<span id="comment-id">${rcc.reviewCommentWriter }</span>&nbsp;
                     					<span id="comment-date">${rcc.reviewCommentDate }</span>
                  					</div>
                  					
                  					<c:if test="${sessionScope.m != null }"><!-- 로그인이 되어있을 때 -->
                  						<div class="comment-link">
                  	 					<c:if test="${sessionScope.m.memberId.equals(rcc.reviewCommentWriter) }"><!-- 로그인 한 회원과 댓글 작성자가 같을 때 -->
                     						<a class="comment-a" href="javascript:void(0)" onclick="modifyComment(this,'${rcc.reviewCommentNo }','${rev.reviewNo }')">수정</a>&ensp;
                     						<a class="comment-a" href="javascript:void(0)" onclick="deleteComment(this,'${rcc.reviewCommentNo }','${rev.reviewNo }')">삭제</a>&ensp;
                     					</c:if><!-- 로그인 한 회원과 댓글 작성자가 같을 때 -->
                  						</div>
                  					</c:if><!-- 로그인이 되어있을 때 -->
               					</div>
               					<div class="comment-content">
               						<p>${rcc.reviewCommentContentBr }</p>
               						<textarea name="reviewCommentContent" class="comment-change" style="display:none;">${rcc.reviewCommentContent }</textarea>
               					</div>
            				</div>
                  		</c:if><!-- 대댓글인지 && 해당하는 댓글번호의 대댓글인지 -->
                  	</c:forEach><!-- 댓글에 달린 대댓글 -->
                </c:if><!-- 원댓글인지 -->
            </c:forEach><!-- 댓글 -->

            </div><!-- comment-list  -->
       </div><!-- commnet-wrap -->
   </div><!-- content-wrap -->
	<jsp:include page="/WEB-INF/views/used/usedChat.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	
	//리뷰 삭제 버튼 클릭 했을 때
	function deleteReview(reviewNo) {
		if(confirm("삭제한 글은 복구되지 않습니다. 삭제하시겠습니까?")) {
			location.href="/deleteReview.do?reviewNo="+reviewNo;
		}
	}
	
	//답글달기 클릭했을 때 작성 창 보여주기
	$(".recShow").click(function() {
		$(this).hide();
		var idx = $(".recShow").index(this);
		$(".recCancel").eq(idx).parents("div").css("display","block");
	});
	
	//답글달기 창에서 취소 버튼 클릭했을 때 작성 창 사라지기
	$(".recCancel").click(function() {
		var idx = $(".recCancel").index(this);
		$(this).parents(".comment-re-write").css("display","none");
		$(".recShow").eq(idx).show();
	});	
	
	//댓글의 수정 버튼을 클릭했을 때
	function modifyComment(obj, commentNo, reviewNo) {
		$(obj).parents('.comment-info').siblings('.comment-content').find('textarea').show(); //textarea를 보여주는 코드
		$(obj).parents('.comment-info').siblings('.comment-content').find('p').hide(); //p태그를 숨기는 코드
		
		//수정 -> 수정완료 버튼
		$(obj).html('수정완료');
		//함수도 변경
		$(obj).attr('onclick', 'modifyComplete(this,"'+commentNo+'","'+reviewNo+'")');
		
		//삭제 -> 취소 버튼
		$(obj).next().html('취소');
		//함수도 변경
		$(obj).next().attr('onclick', 'modifyCancel(this,"'+commentNo+'","'+reviewNo+'")');
		
		//답글달기 버튼 숨기기
		$(obj).next().next().hide();
	}
	
	//댓글 수정 시 수정완료 버튼을 클릭했을 때
	function modifyComplete(obj, commentNo, reviewNo) {
		var form = $("<form action='/updateReviewComment.do' method='post'><form>");
		//append : 자식으로 추가
		form.append($("<input type='text' name='reviewCommentNo' value='"+commentNo+"'>"));
		form.append($("<input type='text' name='reviewNo' value='"+reviewNo+"'>"));
		form.append($(obj).parents('.comment-info').siblings('.comment-content').find('textarea'));
		$("body").append(form);
		form.submit();
	}
	
	//댓글 수정 시 취소 버튼을 클릭했을 때
	function modifyCancel(obj, commentNo, reviewNo) {
		$(obj).parents('.comment-info').siblings('.comment-content').find('textarea').hide(); //textarea를 숨기는 코드
		$(obj).parents('.comment-info').siblings('.comment-content').find('p').show(); //p태그를 보여주는 코드
		
		//수정완료 -> 수정 버튼
		$(obj).prev().html('수정');
		//함수도 변경
		$(obj).prev().attr('onclick', 'modifyComment(this,"'+commentNo+'","'+reviewNo+'")');
		
		//취소 -> 삭제 버튼
		$(obj).html('삭제');
		//함수도 변경
		$(obj).attr('onclick', 'deleteComment(this,"'+commentNo+'","'+reviewNo+'")');
		
		//답글달기 버튼 나타나기
		$(obj).next().show();
	}	
	
	//댓글 삭제 버튼 클릭 했을 때
	function deleteComment(obj, commentNo, reviewNo) {
		if(confirm("댓글을 삭제하시겠습니까?")) {
			location.href="/deleteReviewComment.do?reviewCommentNo="+commentNo+"&reviewNo="+reviewNo;
		}
	}
	
	</script>
	
</body>
</html>