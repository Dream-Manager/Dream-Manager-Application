if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
		
		// Dashboard Create Dream Toggle
		jQuery(function(){
			jQuery("#inline_create_dream_toggle").click(function(){
				jQuery("#inline_create_dream_form").toggle();
			});
		});
		
	})(jQuery);
}
