/**
 * Created by M. Yegorov on 2015-02-19.
 */

$(function(){

	var onPolymerReady = function(){

	};

	var onDOMReady = function(){
		$('body').append('<x-app>');
	}




	// initialization part 1: Basic DOM loaded
	$(function(){

		console.info('Root DOM ready');

		// If this is not IE or its IE 10 - launch the webapp (IE11 and greater aren't having "MSIE" in userAgent)
		if (navigator.userAgent.indexOf('MSIE') == -1 || navigator.userAgent.indexOf('MSIE 10') != -1) {

			onDOMReady();

		} else {
			// get outdated-browser warning
			$.get('includes/outdated.html').then(function(html){
				$('body').append(html);
			});
		}
	});


	// initialization part 2: Polymer finished it's startup
	$(window).on('polymer-ready', function(){
		console.info('Polymer ready');

		onPolymerReady();
	});

})
