$(function() {
	$(".menu li>a").hover(function() {
    	$(this).parent().css('background-color', '#63C783');
	}, function() {
    	$(this).parent().css('background-color', '#cccccc');
	});
	$('[data-toggle="tooltip"]').tooltip({
		// container: "body",
		delay: { "show": 0, "hide": 10 }
	});
	$('.tooltip-right').tooltip({
		placement: 'right',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-viewport-right').tooltip({
		placement: 'right',
		viewport: {selector: '.container-viewport', padding: 2}
	});
	$('.tooltip-viewport-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: '.container-viewport', padding: 2}
	});
});