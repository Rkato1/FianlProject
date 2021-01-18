<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/opCampForm.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp"/>
	<section>
        <div class="content" style="margin:0 auto">
            <div style="margin:0 auto">
             <h4>캠핑장 등록</h4>
             <hr>
             <form action="/insertCamp.do" method="post" >
                <div>
                	<table class="camp_info table">
                		<tr>
                			<th rowspan="2">메인이미지(썸네일)</th>
                			<td>
								  <input type="file" >  			
                			</td>
                		</tr>
                		<tr>
                			<td>
	                			<div class="img-wrapper">
						              <img/>
		               			</div>     
	               			</td>
                		</tr>
	                     <tr>
	                    	<th><span class="title">캠핑장 주소</span></th>
	                    	<td><input type="text" name="campAddr" readonly><input type="button" onclick="execDaumPostcode()" value="주소찾기"></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">캠핑장 유형</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campType">산</label>
	                    		<label><input type="checkBox" name="campType">숲</label>
	                    		<label><input type="checkBox" name="campType">해변</label>
	                    		<label><input type="checkBox" name="campType">강</label>
	                    	</td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">문의처</span></th>
	                    	<td><input type="text" name="campPh"></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">운영기간</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campPeriod">봄</label>
	                    		<label><input type="checkBox" name="campPeriod">여름</label>
	                    		<label><input type="checkBox" name="campPeriod">가을</label>
	                    		<label><input type="checkBox" name="campPeriod">겨울</label>
	                    	</td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">운영일</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campDay">평일</label>
	                    		<label><input type="checkBox" name="campDay">주말</label>
	                    		<label><input type="checkBox" name="campDay">공휴일</label>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<th><span class="title">이용 가능시설</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campFacility">전기</label>
	                    		<label><input type="checkBox" name="campFacility">와이파이</label>
								<label><input type="checkBox" name="campFacility">수영장</label>
	                    		<label><input type="checkBox" name="campFacility">운동장</label><br>
								<label><input type="checkBox" name="campFacility">샤워장</label>
								<label><input type="checkBox" name="campFacility">장작판매</label>
								<label><input type="checkBox" name="campFacility">화장실</label>
								<label><input type="checkBox" name="campFacility">마트/편의점</label>
							</td>
	                    </tr>
                    </table>
                </div>
                <br>
                <h4>소개글 작성</h4>
                <table class="table">
		            <tr>
	                	<th rowspan="2">소개 이미지(3개)</th>
	                	<td>
							<input type="file" >  			
	                	</td>
	                </tr>
	                <tr>
	                	<td></td>
	                </tr>
	                <tr>
                		<div class="img-wrapper">
					    	<img/>
	               		</div>     
                	</tr>
                	<tr>
                		<th>소개글</th>
                		<td>
                			<textarea name="campShow"></textarea>
                		</td>
                </table>
                <br>
                <br>
                <br>
                <div style="text-align: center;">
                	<input type="submit" class="updateBtn" value="등록하기">
                	<button type="button" class="btn-cancel" onclick="location.href='/operatorpage.do'">취소</button>
                </div>
                </form>
            </div>
        </div>
     </section>
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
     <script>
     function execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var addr = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수

                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }

                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                 if(data.userSelectedType === 'R'){
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("campAddr").value = extraAddr;
                 
                 } else {
                     document.getElementById("campaddr").value = '';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById("useraddr").value = addr;
             }
         }).open();
     }
     </script>
</body>
</html>