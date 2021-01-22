<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고상세페이지</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <!-- Font Awesome-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
    <style>
        /* 스와이프 */
         html,
    body {
      position: relative;
      height: 100%;
    }
    .swiper-container {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    :root{
        --swiper-theme-color: #1d0202 !important;
    }
        .section-size{
            width: 1000px;
            margin: 0 auto;
        }
        .bootcol{
            margin: 0;
            padding: 0;
        }
        .hei{
            margin-top: 50px;
            height: 500px;
        }
        .mid-img img{
            border: 1px solid #e0e0e0;
            object-fit: cover;
            width: 500px;
            height: 500px;
            margin: 0;
            padding: 0;
        }
        .one{
            float: left;
        }
        .use-font{
            color: #fa9b00;
            font-weight: bold;
        }
        #chatBtn{
            background-color: #1d0202;
            border: none; 
            color: white; 
            width: 100%; 
            height: 50px;
            transition: background-color .2s;
            cursor: pointer;
            border-radius: 5px;
        }
        #chatBtn:hover{
            color: #1d0202;;
            background-color: #fa9b00;
        }
        #usedReview{
            resize: none;
        }
        #usedReviewBtn{
            width: 130px;
            height: 102px;
            background-color: #1d0202;
            border: none;
            color: #e0e0e0;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color .2s;
        }
        #usedReviewBtn:hover{
            color:#1d0202;
            background-color: #fa9b00;
        }
        .used-write {
         background-color: #FAFAFA;
         margin-top: 20px;
         padding: 20px 0px 20px 30px;
         /*위 오 아래 왼*/
      }
      .used-write>form>textarea, .used-change {
         width: 850px;
         vertical-align: middle;
         outline: none;
         resize: none;
         border: 1px solid #d3d3d3;
      }
      #usedWriteBtn {
         width: 80px;
         height: 80px;
         color: white;
         background-color: #f49b00;
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
         font-size: 14px;
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
         resize: none;
      }
      /*대댓글 창 생성*/
      .comment-re-write {
      	 background-color: #FAFAFA;
         margin-top: 20px;
         padding: 20px 0px 20px 30px;
         /*위 오 아래 왼*/
      }
      .comment-re-write>form>textarea {
         width: 670px;
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
      .comment-arrow {
         width: 80px;
         height: 60px;
         text-align: center;
         color: #6c757d;
         font-size: 25px;
         transform: rotate(180deg);
         float: left;
       }
      
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <!-- 상품아이템 -->
        <main class="section-size hei" style="margin-bottom: 80px;">
            <div>
                <div class="col-md-6 mid-img bootcol one" style="padding: 0;">
                    <!-- Swiper -->
                    <div class="swiper-container" style="width: 500px; height: 500px;">
                        <div class="swiper-wrapper">
                        <c:forEach items="${list }" var="l">
                        <div class="swiper-slide"><img src="resources/upload/used/${l.filepath }"></div>
                        </c:forEach>
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next" style="color: #1d0202;"></div>
                        <div class="swiper-button-prev" style="color: #1d0202;"></div>
                    </div>
                </div>
                <div class="col-md-6 one bootcol" style="width: 450px; margin-left: 50px;">
                    <div style="font-weight: bold; font-size: 24px; margin-bottom: 30px; padding-left:15px;">
                        <pre>${u.usedTitle }</pre>
                    </div>
                    <div>
                        <div class="col-md-3 one bootcol" style="font-size: 14px; font-weight: 600;">
                            <p>제품종류</p>
                            <p>교환여부</p>
                            <p>제품상태</p>
                            <p>거래지역</p>
                        </div>
                        <div class="col-md-9 bootcol"style="font-size: 14px;">
                            <p>${u.category }</p>
                            <p>${u.usedChange }</p>
                            <p>${u.usedState }</p>
                            <p>${u.usedArea }</p>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div class="col-md-3 one bootcol" style="line-height: 40px; font-weight: 600;">
                            <p>가격</p>
                        </div>
                        <div class="col-md-9 bootcol" style="font-weight: 800; font-size: 26px;  color: #f49b00;">
                            <p>${u.usedPrice } 원</p>
                        </div>
                    </div>
                    <hr>
                    <c:if test="${sessionScopem.m != null }">
                    <div style="font-size: 26px; text-align: center; font-weight: 800; color: #fa9b00; margin-top: 60px;">로그인 후 이용해 주세요.</div>
                    <div style="font-size: 26px; text-align: center; font-weight: 800; color: #fa9b00; margin-top: 10px;">^_^</div>
                    </c:if>
                    <c:if test="${sessionScope.m.memberId != u.usedWriter && sessionScope.m != null }">
                    <button id="chatBtn" type="button" value="" onclick="javascript:chatPop('${u.usedWriter }')">채팅하기</button>
                    </c:if>
                    <c:if test="${sessionScope.m.memberId == u.usedWriter }">
                    <a href="/updateEnroll.do?usedNo=${u.usedNo }"><input id="chatBtn" type="button" value="수정하기" style="margin-top: 7px; width: 49%;margin-right: 3px;"></a>
                    <a href="javascript:void(0)" onclick="deleteEnroll(${u.usedNo })"><input id="chatBtn" type="button" value="삭제하기" style="margin-top: 7px; width: 49%;"></a>
                    </c:if>
                </div>
            </div>
        </main>
        <!-- 상품설명  -->
        <section class="section-size" style="height: 300px;">
            <div class="bootcol">
                <p style="font-size: 20px; font-weight: 700; margin: 0;">상품설명</p>
            </div>
            <hr style="border: 2px solid #1d0202; margin-bottom: 8px; margin-top: 5px;">
            <span>${u.usedContentBr }</span>
        </section>
        <!-- 상품문의 댓글-->
        <section class="section-size">
            <div class="bootcol">
                <p style="font-size: 20px; font-weight: 700; margin: 0;">상품문의&nbsp;
                <span class="comment-cnt" style="font-size: 14px; color: #f49b00;">댓글 <span>${cnt }</span>개</span></p>
            </div>
            <hr style="border: 2px solid #1d0202; margin-bottom: 8px; margin-top: 5px;">
             <!-- 로그인 안되어있으면, 댓글 등록창 안보이게 -->
         <c:if test="${sessionScope.m != null }">
         <div class="used-write">
            <form action="/usedComment.do" method="post">
            	<input type="hidden" name="commentLevel" value="1">
            	<input type="hidden" name="commentWriter" value="${sessionScope.m.memberId }">
            	<input type="hidden" name="usedNo" value="${u.usedNo }">
            	<input type="hidden" name="commentRef" value="0">	
            	<textarea rows="3" cols="30" name="commentContent" style="height: 80px;"></textarea>&nbsp;
            	<input type="submit" value="등록" class="btn" id="usedWriteBtn">
            </form>
         </div>
         </c:if>
         <div class="used-comment-list" style="margin-top:20px;">
         	<c:forEach items="${clist }" var="cl"><!-- 댓글 -->
         		<c:if test="${cl.commentLevel == 1 }"><!-- 댓글의 구분 -->
         			<div class="comment-one">
               			<div class="comment-info">
                  			<div class="comment-img">
                  				<img src="resources/upload/common/user.png">
                  			</div>
                  			<div class="comment-user">
                     			<span id="comment-id">${cl.commentWriter }</span>&nbsp;
                     			<span id="comment-date">${cl.commentDate }</span>
                  			</div>
                  			
                  			<c:if test="${sessionScope.m != null }"><!-- 로그인이 되어있는 상태이면 보여줌 -->
                  			<div class="comment-link">
                  	 			<c:if test="${sessionScope.m.memberId.equals(cl.commentWriter) }"><!-- 로그인 한 회원과 댓글 작성자가 같을 때 수정과 삭제를 가능하게 함-->
                     			<a class="comment-a" href="javascript:void(0)" onclick="modifyComment(this,'${cl.commentNo }','${u.usedNo }')">수정</a>&ensp;
                     			<a class="comment-a" href="javascript:void(0)" onclick="deleteComment(this,'${cl.commentNo }','${u.usedNo }')">삭제</a>&ensp;
                     			</c:if><!-- 로그인 한 회원과 댓글 작성자가 같을 때 수정과 삭제를 가능하게 함-->
                     			<a class="comment-re recShow" href="javascript:void(0)" >답글달기</a>
                  			</div>
                  			</c:if><!-- 로그인이 되어있는 상태이면 보여줌 -->
                  		</div><!-- comment-info -->
                  		
                  		<!-- p태그는 조회 할때(Br사용) / textarea는 수정 할때 -->
                  		<div class="comment-content">
                  			<p>${cl.commentContentBr }</p>
                  			<textarea name="commentContent" class="comment-change" style="display:none; resize: none; width: 400px; height: 80px;">${cl.commentContent }</textarea>
                  		</div>
                  		
                  		<!-- 답글 달기 창 숨겨두기 -->
                  		<div class="comment-re-write" style="display:none;">
                  		    <div class="comment-arrow">
                  				<i class="fas fa-reply"></i>
               				</div>
            				<form action="/usedComment.do" method="post">
               					<input type="hidden" name="commentLevel" value="2">
              					<input type="hidden" name="commentWriter" value="${sessionScope.m.memberId }">
               					<input type="hidden" name="usedNo" value="${cl.usedNo }">
               					<input type="hidden" name="commentRef" value="${cl.commentNo }">	
               					<textarea rows="3" cols="30" name="commentContent" style="resize: none; height: 80px;"></textarea>&nbsp;
               					<input type="submit" value="등록" class="btn" id="commentWriteBtn">
               					<input type="button" value="취소" class="btn recCancel" id="commentCancelBtn">
            				</form>
         		  		</div><!-- comment-write  -->
                  	</div><!-- comment-one -->
                  	
                  	<c:forEach items="${clist }" var="cll"><!-- 댓글에 달린 대댓글 -->
                  		<c:if test="${cll.commentLevel == 2 && cll.commentRef == cl.commentNo }"><!-- 대댓글인지 && 해당하는 댓글번호의 대댓글인지 -->
                  			<div class="comment-one">
               					<div class="comment-arrow">
                  					<i class="fas fa-reply"></i>
               					</div>
               					<div class="comment-info">
                  					<div class="comment-img">
                     					<img src="resources/upload/common/user.png">
                  					</div>
                  					<div class="comment-user">
                     					<span id="comment-id">${cll.commentWriter }</span>&nbsp;
                     					<span id="comment-date">${cll.commentDate }</span>
                  					</div>
                  					
                  					<c:if test="${sessionScope.m != null }"><!-- 로그인이 되어있을 때 -->
                  						<div class="comment-link">
                  	 					<c:if test="${sessionScope.m.memberId.equals(cll.commentWriter) }"><!-- 로그인 한 회원과 댓글 작성자가 같을 때 -->
                     						<a class="comment-a" href="javascript:void(0)" onclick="modifyComment(this,'${cll.commentNo }','${u.usedNo }')">수정</a>&ensp;
                     						<a class="comment-a" href="javascript:void(0)" onclick="deleteComment(this,'${cll.commentNo }','${u.usedNo }')">삭제</a>&ensp;
                     					</c:if><!-- 로그인 한 회원과 댓글 작성자가 같을 때 -->
                  						</div>
                  					</c:if><!-- 로그인이 되어있을 때 -->
               					</div>
               					<div class="comment-content">
               						<p>${cll.commentContentBr }</p>
               						<textarea name="commentContent" class="comment-change" style="display:none; width: 400px; height: 80px; resize: none;">${cll.commentContent }</textarea>
               					</div>
            				</div>
                  		</c:if><!-- 대댓글인지 && 해당하는 댓글번호의 대댓글인지 -->
                  	</c:forEach><!-- 댓글에 달린 대댓글 -->
         		</c:if>
         	</c:forEach>
         </div>
        </section>
        <div style="height: 200px"></div>
        
    <jsp:include page="/WEB-INF/views/used/usedChat.jsp"/>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <!-- 스트립트부분 -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>  
	    
	    function chatPop(umReceiver){
	    	if($("#container").css('display') == "none"){
				$("#chat-icon").css('transition','all ease 0.5s');
				$("#chat-icon").css('-webkit-transform',' rotate(45deg)');
				$("#container").show();
			}
	    	selectMessage(umReceiver);
	 	}
	    
	    

    
        var swiper = new Swiper('.swiper-container', {
          pagination: {
            el: '.swiper-pagination',
            type: 'progressbar',
          },
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
        });
      //상품삭제 클릭 시 
    	function deleteEnroll(usedNo) {
    		if(confirm("등록하신 중고상품을 삭제하시겠습니까?")) {
    			location.href="/deleteEnroll.do?usedNo="+usedNo;
    		}
    	}
      ///////////////////////////////////////////
      
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
    	function modifyComment(obj, commentNo, usedNo) {
    		$(obj).parents('.comment-info').siblings('.comment-content').find('textarea').show(); //textarea를 보여주는 코드
    		$(obj).parents('.comment-info').siblings('.comment-content').find('p').hide(); //p태그를 숨기는 코드
    		
    		//수정 -> 수정완료 버튼
    		$(obj).html('수정완료');
    		//함수도 변경
    		$(obj).attr('onclick', 'modifyComplete(this,"'+commentNo+'","'+usedNo+'")');
    		
    		//삭제 -> 취소 버튼
    		$(obj).next().html('취소');
    		//함수도 변경
    		$(obj).next().attr('onclick', 'modifyCancel(this,"'+commentNo+'","'+usedNo+'")');
    		
    		//답글달기 버튼 숨기기
    		$(obj).next().next().hide();
    	}
    	
    	//댓글 수정 시 수정완료 버튼을 클릭했을 때
    	function modifyComplete(obj, commentNo, usedNo) {
    		var form = $("<form action='/updateComment.do' method='post'><form>");
    		//append : 자식으로 추가
    		form.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
    		form.append($("<input type='text' name='usedNo' value='"+usedNo+"'>"));
    		form.append($(obj).parents('.comment-info').siblings('.comment-content').find('textarea'));
    		$("body").append(form);
    		form.submit();
    	}
    	
    	//댓글 수정 시 취소 버튼을 클릭했을 때
    	function modifyCancel(obj, commentNo, usedNo) {
    		$(obj).parents('.comment-info').siblings('.comment-content').find('textarea').hide(); //textarea를 숨기는 코드
    		$(obj).parents('.comment-info').siblings('.comment-content').find('p').show(); //p태그를 보여주는 코드
    		
    		//수정완료 -> 수정 버튼
    		$(obj).prev().html('수정');
    		//함수도 변경
    		$(obj).prev().attr('onclick', 'modifyComment(this,"'+commentNo+'","'+usedNo+'")');
    		
    		//취소 -> 삭제 버튼
    		$(obj).html('삭제');
    		//함수도 변경
    		$(obj).attr('onclick', 'deleteComment(this,"'+commentNo+'","'+usedNo+'")');
    		
    		//답글달기 버튼 나타나기
    		$(obj).next().show();
    	}	
    	
    	//댓글 삭제 버튼 클릭 했을 때
    	function deleteComment(obj, commentNo, usedNo) {
    		if(confirm("댓글을 삭제하시겠습니까?")) {
    			location.href="/deleteComment.do?usedNo="+usedNo;
    		}
    	}
      </script>
</body>
</html>