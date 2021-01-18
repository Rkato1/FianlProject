	$(function(){
		var name = '${sessionScope.m.memberName}';
		$("#memberName").val(name);
	})
	$("#inputName").keyup(function(){
		var val = $(this).val();
		$("#memberName").val(val);
	});
	$("#inputPw").keyup(function(){
		var val = $(this).val();
		$("#reservePw").val(val);
	});	
	$("#inputCarNumber").keyup(function(){
		var val = $(this).val();
		$("#carNumber").val(val);
	});
	$("#inputMemo").keyup(function(){
		var val = $(this).val();
		$("#reserveMemo").val(val);
	});
	function checkFrm(){
		var cnt = 0;
		$(".siteChkbx").each(function(idx,item){
			if($(this).eq(idx).is(':checked')){
				cnt++;
			}
		});
		if(cnt>0){
			bool = true;
		}else{
			//site체크박스에 체크가 안되어있다.			
			bool = false;
		}
		//bool이 참이면 submit 해도됨
		//bool이 false이면 submit작동 하면 안댐
		if(!bool){
			alert("사이트 체크 및 예약자 정보를 확인해주세요");
		}
		return bool;		
	}

$('.siteChkbx').click(function(){
		var idx = $('.siteChkbx').index($(this));
		if($(this).is(':checked')){
			var total = getSumTr(idx);
			printSum(idx,total);			
		}else{
			var sum = 0;
			$(".sumTr").eq(idx).html(sum);		
		}
		printTotal();
	});	
	
	$('.usingNight').change(function(){			
		var idx = $('.usingNight').index($(this));
		if($('.siteChkbx').eq(idx).is(':checked')){
			var total = getSumTr(idx);
			printSum(idx,total);
			printTotal();
		}
	});
	$('.usingCnt').change(function(){		
		var idx = $('.usingCnt').index($(this));
		if($('.siteChkbx').eq(idx).is(':checked')){
			var total = getSumTr(idx);
			printSum(idx,total);
			printTotal();
		}
	});	
	
	$(".carChkbx").click(function(){
		if($(this).is(':checked')){
			console.log("car체크박스  체크됨");
			var total = getSumCar();
			printSumCar(total);			
		}else{
			console.log("car체크박스 체크해제됨");
			var sum = 0;
			$("#carSum").html(sum);	
		}
		printTotal();
	});
	
	$('.addCarDay').change(function(){		
		if($('.carChkbx').is(':checked')){
			var total = getSumCar();
			printSumCar(total);
			printTotal();
		}
	});
	$('.addCarCnt').change(function(){		
		if($('.carChkbx').is(':checked')){
			var total = getSumCar();
			printSumCar(total);
			printTotal();
		}
	});	
	
	function getSumTr(idx) {
		var usPay = $(".usingPay").eq(idx).val(); //이용금액
		var usNight = $(".usingNight").eq(idx).val(); //이용박수
		var discntPay = $(".discountPay").eq(idx).val(); //연박할인비용
		var usCnt = $(".usingCnt").eq(idx).val(); //이용인원
		var minCnt = $(".minCnt").eq(idx).val(); //기준인원
		var addCntPay = $(".addCntPay").eq(idx).val(); //추가인원비용
		var sum = (usPay * usNight) -((usNight-1) * discntPay) + (usNight * (usCnt-minCnt) * addCntPay) ;	//합계 = (이용금액 * 이용박수) -((이용박수-1) * 연박할인비용) + (이용박수 * (이용인원-기준인원) * 추가인원비용)
		
		return sum;
	}
	function printSum(idx,total){
		var don = String(total);
		don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(".sumTr").eq(idx).html(don);
	}
	function getSumCar() {
		var carPay = $(".addCarPay").val();//주차비
		var carday= $(".addCarDay").val();//주차기간
		var carCnt= $(".addCarCnt").val();//차량수
		var sum = (carPay*carday*carCnt);//합계 = (주차비 * 기간 * 차량수)
		
		return sum;
	}
	function printSumCar(total){
		var don = String(total);
		don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#carSum").html(don);	
	}
	function printTotal(){		
		var total = 0;  //초기화
		$(".sumTr").each(function(){ //site_name별 합계			
			var str = $(this).html();
			str = str.replace(/[^\d]+/g, "");
			total += Number(str);
		});	
		var str2 = $("#carSum").html(); //추가 주차 합계	
		str2 = str2.replace(/[^\d]+/g, "");
		total += Number(str2);
		$("#reservePrice").attr("value",total);
		var don = String(total);
		don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");//그 총계를 천단위 구분기호를 넣는다.
		$("#total").html(don);//그리고 총계를 화면에 출력한다.
	}
	
	