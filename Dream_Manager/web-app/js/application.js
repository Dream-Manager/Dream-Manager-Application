if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
		
		$(".datepicker").datepicker();
		$(".tabs").tabs();
		$(".accordion" ).accordion(); 
		$(".progressbar" ).progressbar();
	})(jQuery);
}