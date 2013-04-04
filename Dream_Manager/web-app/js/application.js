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
 		$(".progressbar" ).each(function(){
			$this = $(this);
			percentage = Number($this.text());
			$progressbar = $("<div></div>").progressbar({value:percentage});
			$this.replaceWith($progressbar);
 	 	});

	})(jQuery);
}