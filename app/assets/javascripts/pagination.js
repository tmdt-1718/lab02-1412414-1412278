jQuery(function() {
	if ($('#infinite-scrolling').size() > 0) {
		$(window).on("scroll", function() {
			more_posts_url = $('.pagination .next_page a').attr('href');

			if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
			   	$('.pagination').html('<img src="/assets/Wedges-345278e51adf979e00a71306792b5bf8355a88b3074a004ad12da6418bdf4c5b.gif" alt="Loading..." title="Loading..." />');
			   	$('#infinite-scrolling').css("display", "block");
			   	$.getScript(more_posts_url);
			}		        	
		});	    	
	}
});