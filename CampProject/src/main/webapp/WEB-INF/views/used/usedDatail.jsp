<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고상세페이지</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
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
            transition: background-color .5s;
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
            transition: background-color .5s;
        }
        #usedReviewBtn:hover{
            color:#1d0202;
            background-color: #fa9b00;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<header style="height: 200px; text-align: center; background-color: orang;"><h1>헤드입니다.</h1></header>
        <!-- 상품아이템 -->
        <main class="section-size hei" style="margin-bottom: 80px;">
            <div>
                <div class="col-md-6 mid-img bootcol one">
                    <!-- Swiper -->
                    <div class="swiper-container" style="width: 500px; height: 500px;">
                        <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="/img/camp.png"></div>
                        <div class="swiper-slide">스크립</div>
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next" style="color: #1d0202;"></div>
                        <div class="swiper-button-prev" style="color: #1d0202;"></div>
                    </div>
                </div>
                <div class="col-md-6 one bootcol" style="width: 450px; margin-left: 50px;">
                    <div style="font-weight: bold; font-size: 24px; margin-bottom: 30px;">
                        <pre>제목들어갈자리입니다.안녕하세요?</pre>
                    </div>
                    <div>
                        <div class="col-md-3 one bootcol">
                            <p>제품상태</p>
                            <p>교환여부</p>
                            <p>배송비</p>
                            <p>거래지역</p>
                        </div>
                        <div class="col-md-9 bootcol">
                            <p>중고</p>
                            <p>교환불가능</p>
                            <p>별도</p>
                            <p>전지역</p>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div class="col-md-3 one bootcol" style="line-height: 37px;">
                            <p>가격</p>
                        </div>
                        <div class="col-md-9 bootcol" style="font-weight: 800; font-size: 26px;">
                            <p>500,000원</p>
                        </div>
                    </div>
                    <hr>
                    <input id="chatBtn" type="button" value="채팅하기" >
                </div>
            </div>
        </main>
        <!-- 상품설명  -->
        <section class="section-size" style="height: 300px;">
            <div class="bootcol">
                <p style="font-size: 20px; font-weight: 700;">상품설명</p>
            </div>
            <hr style="border: 2px solid #1d0202; margin-bottom: 5px;">
            <span>안녕하세요</span>
        </section>
        <!-- 상품문의 댓글-->
        <section class="section-size">
            <div class="bootcol">
                <p style="font-size: 20px; font-weight: 700;">상품문의</p>
            </div>
            <hr style="border: 2px solid #1d0202; margin-bottom: 5px;">
            <div>
                <div class="bootcol"style="float: left;">
            <textarea name="usedReview" id="usedReview" cols="105" rows="4" placeholder="문의하실 내용을 입력해주세요."></textarea>
        </div>
            <div class="bootcol" style="float: left; margin-left: 8px;">
            <input type="button" value="문의하기" id="usedReviewBtn">
        </div>
            </div>
        </section>
        <div style="height: 200px"></div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <!-- 스트립트부분 -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
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
      </script>
</body>
</html>