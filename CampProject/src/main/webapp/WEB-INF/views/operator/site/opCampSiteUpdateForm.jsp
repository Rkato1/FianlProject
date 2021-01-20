<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/operator/menu_content.css" type="text/css" rel="stylesheet">
<link href="../css/operator/campSiteForm.css" type="text/css" rel="stylesheet">
<link href="../css/operator/btn.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/operator/opHeader.jsp" />
	<section>
		<div> <!-- 섹션아래 div -->
			<div>
				<h2>${camp.campName } 사이트 등록</h2>
			</div>
			<hr>
			
			<div class="content" style="width:100%;">
				<div class="tbl-wrapper"  style="margin:0 auto;">
					<form action="/updateSite.do" method="post">
					<input type="hidden" name="siteNo" value="${site.siteNo }">
					<input type="hidden" name="campNo" value="${camp.campNo }">
					<table class="table">
						<tr>
							<th class="th-info" style="width:20%;">사이트 카테고리</th>
							<td><input type="text" name="siteTitle" class="input-s" maxlength="10" value="${site.siteTitle }"></td>
							<td>
								<c:if test="${fn:length(categorys)!=0}">
									<select id="selct" class="input-s">
									<c:forEach items="${categorys }" var="ct">
										<option value="${ct }">${ct }</option>
									</c:forEach>
									</select>
								</c:if>
							</td>
						</tr>
						<tr>
							<th class="th-info">사이트 이름</th>
							<td><input type="text" name="siteName" class="input-s" maxlength="10" value="${site.siteName}"></td>
							<td></td>
						</tr>
					</table>
					<table class="table" style="width:100%;text-align: center;">
						<tr class="th-info">
							<th>최소인원</th>
							<th>최대인원</th>
							<th>최소 숙박일</th>
							<th>최대 숙박일</th>
							<th>연박할인금액</th>
							<th>추가인원금액</th>
							<th>추가차량금액</th>
						</tr>
						<tr>
							<td><input type="number" name="minCnt" min="1" class="input-s" value="${site.minCnt }">명</td>
							<td><input type="number" name="maxCnt" min="1" class="input-s" value="${site.maxCnt }">명</td>
							<td><input type="number" name="minNight" min="1" class="input-s" value="${site.minNight }">박</td>
							<td><input type="number" name="maxNight" min="1" class="input-s" value="${site.maxNight }">박</td>
							<td><input type="number" name="discountPay" min="1000" class="input-s" step="1000" value="${site.discountPay }">원</td>
							<td><input type="number" name="addCntPay" min="1000" class="input-s" step="1000" value="${site.addCntPay }">원</td>
							<td><input type="number" name="addCarPay" min="1000" class="input-s" step="1000" value="${site.addCarPay }">원</td>
						</tr>
					</table>
					<table class="table table-bordered">
						<t>
							<th></th>
							<th class="th-info">비수기</th>
							<th class="th-info">성수기</th>
							<th class="th-info">극성수기</th>
						</tr>
						<tr>
							<th>주중</th>
							<td><span><input type="number" name="lowDayPay" min="1000" class="input-s" step="1000" value="${site.lowDayPay }"></span>원</td>
							<td><span><input type="number" name="peakDayPay" min="1000" class="input-s" step="1000" value="${site.peakDayPay }"></span>원</td>
							<td><span><input type="number" name="polarDayPay" min="1000" class="input-s" step="1000" value="${site.polarDayPay }"></span>원</td>
						</tr>
						<tr>
							<th>주말</th>
							<td><span><input type="number" name="lowEndPay" min="1000" class="input-s" step="1000" value="${site.lowEndPay }"></span>원</td>
							<td><span><input type="number" name="peakEndPay" min="1000" class="input-s" step="1000" value="${site.peakEndPay }"></span>원</td>
							<td><span><input type="number" name="polarEndPay" min="1000" class="input-s" step="1000" value="${site.polarEndPay }"></span>원</td>
						</tr>
					</table>
				</div>			
				<div class="btn-wrapper">
					<input type="submit" class="btn-update" value="수정하기">
					<button type="button" class="btn-cancel" onclick="location.href='/opCampSite.do?campNo=${camp.campNo}'">취소</button>
				</div>
				</form>
			</div>
		</div>
	</section>
								
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
		$("#selct").change(function(){
			$("[name=siteTitle]").val($(this).val());
		});
		
		
		$("[type=submit]").click(function(){
			if($("[name=siteTitle]").val()==""){
				alert("카테고리를 적어주세요");
				$("[name=siteTitle]").focus();
				return false;
			}
			if($("[name=siteName]").val()==""){
				alert("사이트 이름를 적어주세요");
				$("[name=siteName`]").focus();
				return false;
			}
			if($("[name=minCnt]").val()==""){
				alert("최소인원을 적어주세요");
				$("[name=minCnt]").focus();
				return false;
			}
			if($("[name=maxCnt]").val()==""){
				alert("최대인원을 적어주세요");
				$("[name=maxCnt]").focus();
				return false;
			}
			if($("[name=minNight]").val()==""){
				alert("최소 숙박일을 적어주세요");
				$("[name=minNight]").focus();
				return false;
			}
			if($("[name=maxNight]").val()==""){
				alert("최대 숙박일을 적어주세요");
				$("[name=maxNight]").focus();
				return false;
			}
			if($("[name=addCntPay]").val()==""){
				alert("추가 인원 금액을 적어주세요");
				$("[name=siteTitle]").focus();
				return false;
			}
			if($("[name=addCarPay]").val()==""){
				alert("추가 차량 금액을 적어주세요");
				$("[name=addCarPay]").focus();
				return false;
			}
			if($("[name=lowDayPay]").val()==""){
				alert("비수기 평일 금액을 적어주세요");
				$("[name=lowDayPay]").focus();
				return false;
			}
			if($("[name=lowEndPay]").val()==""){
				alert("비수기 주말 금액을 적어주세요");
				$("[name=lowEndPay]").focus();
				return false;
			}
			if($("[name=peakDayPay]").val()==""){
				alert("성수기 주말 금액을 적어주세요");
				$("[name=peakDayPay]").focus();
				return false;
			}
			if($("[name=peakEndPay]").val()==""){
				alert("성수기 주말 금액을 적어주세요");
				$("[name=peakEndPay]").focus();
				return false;
			}
			if($("[name=polarDayPay]").val()==""){
				alert("극성수기 주말 금액을 적어주세요");
				$("[name=polarDayPay]").focus();
				return false;
			}
			if($("[name=polarEndPay]").val()==""){
				alert("극성수기 주말 금액을 적어주세요");
				$("[name=polarEndPay]").focus();
				return false;
			}
		})
		
		
		
	</script>
</body>
</html>