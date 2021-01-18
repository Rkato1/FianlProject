		$(".modalbtn").click(function(){
			var val = $(this).val();			
			var reserveNo = val;
			$("#modalNo").val(reserveNo);
		});
		var bool = new Boolean();
		$(function() {
		})
		$("#inputName").keyup(function() {
			var val = $(this).val();
			$("#memberName").val(val);
		});
		$("#inputPw").keyup(function() {
			var val = $(this).val();
			$("#reservePw").val(val);
		});
		$("#inputCarNumber").keyup(function() {
			var val = $(this).val();
			$("#carNumber").val(val);
		});
		$("#inputMemo").keyup(function() {
			var val = $(this).val();
			$("#reserveMemo").val(val);
		});
		function checkFrm() {
			var cnt = 0;
			$(".siteChkbx").each(function(idx, item) {
				if ($(this).eq(idx).is(':checked')) {
					cnt++;
				}
			});
			if (cnt > 0) {
				bool = true;
			} else {
				//site체크박스에 체크가 안되어있다.			
				bool = false;
			}
			//bool이 참이면 submit 해도됨
			//bool이 false이면 submit작동 하면 안댐
			if (!bool) {
				alert("사이트 체크 및 예약자 정보를 확인해주세요");
			}
			return bool;
		}

		

		$('.usingNight').change(function() {
			var idx = $('.usingNight').index($(this));
			if ($('.siteChkbx').eq(idx).is(':checked')) {
				var total = getSumTr(idx);
				printSum(idx, total);
				printTotal();
				var usNight = $(".usingNight").eq(idx).val();
				$(".listUsingNight").eq(idx).val(usNight);
			}
		});
		$('.usingCnt').change(function() {
			var idx = $('.usingCnt').index($(this));
			if ($('.siteChkbx').eq(idx).is(':checked')) {
				var total = getSumTr(idx);
				printSum(idx, total);
				printTotal();
				var usingCnt = $(".usingCnt").eq(idx).val();
				$(".listUsingCnt").eq(idx).val(usingCnt);
			}
		});

		$(".carChkbx").click(function() {
			if ($(this).is(':checked')) {
				var total = getSumCar();
				printSumCar(total);
				var carday = $(".addCarDay").val();//주차기간
				var carCnt = $(".addCarCnt").val();//차량수
				$(".listAddCarDay").val(carday);
				$(".listAddCarCnt").val(carCnt);
			} else {
				var sum = 0;
				$("#carSum").html(sum);
				var val = 0;
				$(".listAddCarDay").val(val);
				$(".listAddCarCnt").val(val);
			}
			printTotal();
		});

		$('.addCarDay').change(function() {
			if ($('.carChkbx').is(':checked')) {
				var total = getSumCar();
				printSumCar(total);
				printTotal();
				var carday = $(".addCarDay").val();//주차기간
				$(".listAddCarDay").val(carday);
			}
		});
		$('.addCarCnt').change(function() {
			if ($('.carChkbx').is(':checked')) {
				var total = getSumCar();
				printSumCar(total);
				printTotal();
				var carCnt = $(".addCarCnt").val();//차량수
				$(".listAddCarCnt").val(carCnt);
			}
		});

		function getSumTr(idx) {
			var usPay = $(".usingPay").eq(idx).val(); //이용금액
			var usNight = $(".usingNight").eq(idx).val(); //이용박수
			var discntPay = $(".discountPay").eq(idx).val(); //연박할인비용
			var usCnt = $(".usingCnt").eq(idx).val(); //이용인원
			var minCnt = $(".minCnt").eq(idx).val(); //기준인원
			var addCntPay = $(".addCntPay").eq(idx).val(); //추가인원비용
			var sum = (usPay * usNight) - ((usNight - 1) * discntPay)
					+ (usNight * (usCnt - minCnt) * addCntPay); //합계 = (이용금액 * 이용박수) -((이용박수-1) * 연박할인비용) + (이용박수 * (이용인원-기준인원) * 추가인원비용)

			return sum;
		}
		function printSum(idx, total) {
			$(".listReservePay").eq(idx).val(total);
			var don = String(total);
			don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".sumTr").eq(idx).html(don);
		}
		function getSumCar() {
			var carPay = $(".addCarPay").val();//주차비
			var carday = $(".addCarDay").val();//주차기간
			var carCnt = $(".addCarCnt").val();//차량수
			var sum = (carPay * carday * carCnt);//합계 = (주차비 * 기간 * 차량수)

			return sum;
		}
		function printSumCar(total) {
			var don = String(total);
			don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#carSum").html(don);
		}
		function printTotal() {
			var total = 0; //초기화
			$(".sumTr").each(function() { //site_name별 합계			
				var str = $(this).html();
				str = str.replace(/[^\d]+/g, "");
				total += Number(str);
			});
			var str2 = $("#carSum").html(); //추가 주차 합계	
			str2 = str2.replace(/[^\d]+/g, "");
			total += Number(str2);
			$("#reservePrice").attr("value", total);
			$("#reserveTotal").attr("value", total);
			var don = String(total);
			don = don.replace(/\B(?=(\d{3})+(?!\d))/g, ",");//그 총계를 천단위 구분기호를 넣는다.
			$("#total").html(don);//그리고 총계를 화면에 출력한다.
		}

		
		$("#inputName").keyup(function() {
			var val = $(this).val();
			$("#memberName").val(val);
		});
		$("#inputPw").keyup(function() {
			var val = $(this).val();
			$("#reservePw").val(val);
		});
		$("#inputCarNumber").keyup(function() {
			var val = $(this).val();
			$("#carNumber").val(val);
		});
		$("#inputMemo").keyup(function() {
			var val = $(this).val();
			$("#reserveMemo").val(val);
		});
		function checkFrm() {
			var cnt = 0;
			$(".siteChkbx").each(function(idx, item) {
				if ($(this).eq(idx).is(':checked')) {
					cnt++;
				}
			});
			if (cnt > 0) {
				bool = true;
			} else {
				bool = false;
			}
			if (!bool) {
				alert("사이트 체크 및 예약자 정보를 확인해주세요. cnt = " + cnt);
			}
			return bool;
		}
		$("#reserveBtn").click(function() {
			$("#reserveBtn2").click();
		});
		$("#reserveBtn2").click(function() {
			var cnt = 0;
			var siteArr = new Array();
			$(".siteChkbx").each(function(idx, item) {
				//console.log("idx = "+idx);
				if ($(item).is(':checked')) {
					cnt++;
					var site = new Array();
					var siteNo = $(".listSiteNo").eq(idx).val();
					var campNo = $(".listCampNo").eq(idx).val();
					var siteTitle = $(".listSiteTitle").eq(idx).val();
					var siteName = $(".listSiteName").eq(idx).val();
					var minCnt = $(".listMinCnt").eq(idx).val();
					var maxCnt = $(".listMaxCnt").eq(idx).val();
					var minNight = $(".listMinNight").eq(idx).val();
					var maxNight = $(".listMaxNight").eq(idx).val();
					var discountPay = $(".listDiscountPay").eq(idx).val();
					var addCntPay = $(".listAddCntPay").eq(idx).val();
					var addCarPay = $(".listAddCarPay").eq(idx).val();
					var usingCnt = $(".listUsingCnt").eq(idx).val(); //수동입력
					var usingPay = $(".listUsingPay").eq(idx).val(); //수동입력 성수기or비수기or극성수기 주말/평일 구분해서 이용금액이 바뀐다
					var usingNight = $(".listUsingNight").eq(idx).val(); //수동입력
					var addCarDay = $(".listAddCarDay").eq(idx).val(); //수동입력
					var addCarCnt = $(".listAddCarCnt").eq(idx).val(); //수동입력
					var memberNo = $(".listMemberNo").eq(idx).val();
					var reservePay = $(".listReservePay").eq(idx).val();
					var reserveDate = $(".listReserveDate").eq(idx).val();
					var lowDayPay = $(".listLowDayPay").eq(idx).val();
					var lowEndPay = $(".listLowEndPay").eq(idx).val();
					var peakDayPay = $(".listPeakDayPay").eq(idx).val();
					var peakEndPay = $(".listPeakEndPay").eq(idx).val();
					var polarDayPay = $(".listPolarDayPay").eq(idx).val();
					var polarEndPay = $(".listPolarEndPay").eq(idx).val();

					site.push(siteNo);
					site.push(campNo);
					site.push(siteTitle);
					site.push(siteName);
					site.push(minCnt);
					site.push(maxCnt);
					site.push(minNight);
					site.push(maxNight);
					site.push(discountPay);
					site.push(addCntPay);
					site.push(addCarPay);
					site.push(usingCnt);
					site.push(usingPay);
					site.push(usingNight);
					site.push(addCarDay);
					site.push(addCarCnt);
					site.push(memberNo);
					site.push(reservePay);
					site.push(reserveDate);
					site.push(lowDayPay);
					site.push(lowEndPay);
					site.push(peakDayPay);
					site.push(peakEndPay);
					site.push(polarDayPay);
					site.push(polarEndPay);

					siteArr.push(site);

					console.log("siteNo = " + siteNo);
					console.log("site = " + site);
				}
			});

			console.log("siteArr = " + siteArr);
			console.log("cnt = " + cnt);
			$("#siteArr").val(siteArr);
		});