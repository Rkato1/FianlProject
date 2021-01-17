$(function() {
		$(".nav-chevron").next().hide();
});	
$('.nav-chevron').click(function() {
		$(this).next().toggle(400);
		$(this).toggleClass('transform');
})