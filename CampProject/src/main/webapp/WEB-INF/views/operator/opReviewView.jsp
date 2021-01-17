<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
<link href="../css/operator/opReviewView.css" type="text/css" rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
		<div><a href="/opReviewList.do?campNo=${camp.campNo }&reqPage=1">목록으로</a></div>
		<hr>
		<div class="content-wrap" style="margin-top:10px;">
	      <div class="review-title">
	         <h2 style="border-bottom: 2px solid #ccc">${rev.reviewTitle } 
	         <span style="font-size: 15px;">
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
		         </span>
		     </h2>
	      </div>
	      <div class="review-info">
	         <div class="review-user">
	            <span>${rev.memberId }</span>
	            <span>&nbsp;｜&nbsp;</span>
	            <span>${rev.reviewDate }</span>
	         </div>
	      </div>
	     
	      <div class="review-content">
	      	<c:if test="${!empty rev.fileList }">
	      	<div class="review-content-img">
	      		<c:forEach items="${rev.fileList }" var="f">
	      			<img src = "resources/upload/review/${f.filepath }" width="700px">   	
	      		</c:forEach>
			</div>
			</c:if>
			<div class="review-content-text">
				${rev.reviewContentBr }
			</div>
	      </div>
	      <div class="commnet-wrap">
	         <span class="comment-cnt">댓글 <span>${comCnt }</span>개</span>
	         
	         <!-- 로그인 안되어있으면, 댓글 등록창 안보이게 -->
	         <c:if test="${sessionScope.m != null }">
	         <div class="comment-write">
	            <form action="/insertReviewCommentOP.do" method="post">
	            	<input type="hidden" name="reviewCommentLevel" value="1">
	            	<input type="hidden" name="reviewCommentWriter" value="${sessionScope.m.memberId }">
	            	<input type="hidden" name="reviewNo" value="${rev.reviewNo }">
	            	<input type="hidden" name="reviewCommentRef" value="0">	
	            	<textarea rows="3" cols="30" name="reviewCommentContent"></textarea>&nbsp;
	            	<input type="submit" value="등록" class="btn" id="commentWriteBtn">
	            </form>
	         </div>
	         </c:if>
	         
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
	            				<form action="/insertReviewCommentOP.do" method="post">
	               					<input type="hidden" name="reviewCommentLevel" value="2">
	              					<input type="hidden" name="reviewCommentWriter" value="${sessionScope.m.memberId }">
	               					<input type="hidden" name="reviewNo" value="${rev.reviewNo }">
	               					<input type="hidden" name="reviewCommentRef" value="${rc.reviewCommentNo }">	
	               					<textarea rows="3" cols="30" name="reviewCommentContent"></textarea>&nbsp;
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
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>

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
		var form = $("<form action='/updateReviewCommentOP.do' method='post'><form>");
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
			location.href="/deleteReviewCommentOP.do?reviewCommentNo="+commentNo+"&reviewNo="+reviewNo;
		}
	}
	
	</script>
</body>
</html>