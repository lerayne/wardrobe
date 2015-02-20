/**
 * Created by M. Yegorov on 2015-02-19.
 */

$(function(){

	var onDOMReady = function(){

		app.state.windowFocused = document.hasFocus();

		app.connection = new app.class.Connection({
			server: app.cfg.server_url,
			autostart: false
		});

		// поведение при активации и деактивации окна
		$(window).on('blur', function(){

			if (app.state.windowFocused) {
				app.state.windowFocused = false;
				app.connection.setMode('passive');
			}
		});

		$(window).on('focus', function(){

			if (!app.state.windowFocused) {
				app.state.windowFocused = true;
				app.connection.setMode('active');
			}
		});

		// when all pre-startup async calls resolved
		Promise.all(app.service.startupCalls).then(function(){
			console.log('all pre-startup async calls resolved')

			// in Polymer you now can create new active elements as easy as this:
			$('body').append('<x-app>');
		})
		

	};


	var onPolymerReady = function(){
		app.connection.start();
	};




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
