if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
		
		$(".datepicker").datepicker();
		$(".tabs").tabs();
		$(".accordion").accordion({heightStyle: "content"}); 
									collapsible: true,
									active: false
									});
		$(".button").button();
 		$(".progressbar").each(function(){
			$this = $(this);
			percentage = Number($this.text());
			style = $this.attr("style");
			$progressbar = $("<div class='activeProgressbar' style='"+style+"'></div>").progressbar({value:percentage});
			$this.replaceWith($progressbar);
 	 	});
 		
 		$(".slider").each(function(){
			$this = $(this);
			$this.css("display","none");
			percentage = Number($this.val());
			$slider = $("<div class='activeSlider' style='width:10em;'></div>").slider({
				min: 0, 
				max: 100, 
				value: percentage,
				change: function (e, ui) {
					$this.val($(this).slider("option", "value"));
				}
			});
			$this.after($slider);
 	 	});
 		$(".slider").parent("form").submit(function(){
 			$(this).find(".activeSlider").slider("option", "value", 0);
 		});

	})(jQuery);
}