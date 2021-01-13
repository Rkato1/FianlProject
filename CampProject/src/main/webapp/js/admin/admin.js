$(function() {
	$(".menu li>a").hover(function() {
    	$(this).parent().css('background-color', '#63C783');
	}, function() {
    	$(this).parent().css('background-color', '#cccccc');
	});
});