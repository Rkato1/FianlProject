<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/opCampForm.css" type="text/css" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp"/>
	<section>
        <div class="content" style="margin:0 auto">
            <div style="margin:0 auto">
             <h4>캠핑장 등록</h4>
             <hr>
             <form action="/insertCamp.do" method="post" enctype="multipart/form-data">
                <div>
                	<table class="camp_info table">
                		<tr>
                			<th>캠핑장 이름</th>
                			<td>
                				<input type="text" name="campName" maxlength="20"  placeholder="ex)OOO 캠핑장"><span class="comment">20자 이내</span>
                			</td>
                		</tr>
                		<tr>
                			<th rowspan="2">메인이미지(썸네일)</th>
                			<td>
								  <input type="file" name="mainFile" accept="image/jpeg, image/jpg, image/png" onchange="setThumbnail(event);">  			
                			</td>
                		</tr>
                		<tr>
                			<td>
	                			<div class="img-wrapper" id="mainImg-container"></div>     
	               			</td>
                		</tr>
	                     <tr>
	                    	<th><span class="title">캠핑장 주소</span></th>
	                    	<td>
		                    	<input type="text" name="campAddr" readonly> 
		                    	<input type="button" onclick="execDaumPostcode()" value="주소찾기">
	                 		</td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">캠핑장 유형</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campType" value="산">산</label>
	                    		<label><input type="checkBox" name="campType" value="숲">숲</label>
	                    		<label><input type="checkBox" name="campType" value="해변">해변</label>
	                    		<label><input type="checkBox" name="campType" value="강">강</label>
	                    	</td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">문의처</span></th>
	                    	<td><input type="text" name="campPh" placeholder="ex)010-0000-0000  전화번호,이메일 등"></td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">운영기간</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campPeriod" value="봄"> 봄</label>
	                    		<label><input type="checkBox" name="campPeriod" value="여름"> 여름</label>
	                    		<label><input type="checkBox" name="campPeriod" value="가을"> 가을</label>
	                    		<label><input type="checkBox" name="campPeriod" value="겨울"> 겨울</label>
	                    	</td>
	                    </tr>
	                     <tr>
	                    	<th><span class="title">운영일</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campDay" value="평일"> 평일</label>
	                    		<label><input type="checkBox" name="campDay" value="주말"> 주말</label>
	                    		<label><input type="checkBox" name="campDay" value="공휴일"> 공휴일</label>
	                    	</td>
	                    </tr>
	                    <tr>
	                    	<th><span class="title">이용 가능시설</span></th>
	                    	<td>
	                    		<label><input type="checkBox" name="campFacility" value="전기"> 전기</label>
	                    		<label><input type="checkBox" name="campFacility" value="와이파이"> 와이파이</label>
								<label><input type="checkBox" name="campFacility" value="수영장"> 수영장</label>
	                    		<label><input type="checkBox" name="campFacility" value="운동장"> 운동장</label><br>
								<label><input type="checkBox" name="campFacility" value="샤워장"> 샤워장</label>
								<label><input type="checkBox" name="campFacility" value="장작판매"> 장작판매</label>
								<label><input type="checkBox" name="campFacility" value="화장실"> 화장실</label>
								<label><input type="checkBox" name="campFacility" value="마트/편의점"> 마트/편의점</label>
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
							<input type="file" name="files" multiple>  			
	                	</td>
	                </tr>
	                <tr>
	                	<td class="infoImg-container">
	                		 
	               		</td> 
	                </tr>
                	<tr>
                		<th>소개글</th>
                		<td>
                			<textarea name="campShow" placeholder="캠핑장에 대해 설명해 주세요!"></textarea>
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
     $("[type=submit]").click(function(){
    	 if($("[name=campName]").val()==''){
    		 alert("캠핑장 이름을 입력해주세요!");
    		 $("[name=campName]").focus();
			 return false;    		 
    	 }
    	 if($("[name=mainFile]").val()==''){
    		 alert("썸네일을 등록해주세요!");
    		 return false; 
    	 }
    	 if($("[name=campAddr]").val()==""){
    		 alert("캠핑장 주소를 입력해주세요!");
    		 return false; 
    	 }
    	 if($("input:checked[name=campType]").is(":checked") == false){
    		 alert("캠핑장 유형을 체크해주세요!");
    		 return false;
    	 }
    	 if($("[name=campPh]").val()==""){
    		 alert("문의처를 입력해주세요!");
    		 $("[name=campPh]").focus();
    		 return false;
    	 }
    	 if($("input:checked[name=campPeriod]").is(":checked") == false){
    		 alert("운영기간을 체크해주세요!");
    		 return false;
    	 }
    	 if($("input:checked[name=campDay]").is(":checked") == false){
    		 alert("운영일을 체크해주세요!");
    		 return false;
    	 }
    	 if($("[name=files]").val()==""){
    		 alert("소개이미지를 등록해주세요!");
    		 return false;
    	 }

     });
     
     
     function setThumbnail(event) { 
    	 var reader = new FileReader(); 
    	 reader.onload = function(event) { 
    		 var img = document.createElement("img");
    		 img.setAttribute("src", event.target.result); 
    		 document.querySelector("div#mainImg-container").appendChild(img);
    		 }; 
    	reader.readAsDataURL(event.target.files[0]); 
    }

     $(document).ready( function() {
    	 
         $("input[name=files]").change(function () {
             var fileInput = $(this);
             var files = fileInput.files;
             if(files.length>3){
            	 alert("소개이미지 등록은 3장까지만 가능합니다.");
            	 fileInput.val("");
             }
              
         });
  
     });
     
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
                 } 

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 $("[name=campAddr]").val(addr);
             }
         }).open();
     }
     </script>
</body>
</html>