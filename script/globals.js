/**
 * Created by M. Yegorov on 2015-02-20.
 */

window.app = {

	units:[],

	state:{},

	class: {
		strategic: {}
	},

	lang:{
		languages:{},
		locale:'',
		textDefault:{},
		textLocalized:{}
	},

	service:{
		startupCalls:[]
	}
};

// get localized string or english or just key if both absent
window.text = function(key){
	return app.lang.textLocalized[key] ? app.lang.textLocalized[key] : (app.lang.textDefault[key] ? app.lang.textDefault[key] : key);
};

(function(){

	var languages = [];

	var getLanguage = function(languages){

		return new Promise(function(resolve){

			var lang = languages.shift();

			if (app.lang.languages[lang]) {
				resolve(lang)
			} else {
				Promise.resolve($.getJSON('./i18n/'+lang+'.json')).then(function(json){

					app.lang.languages[lang] = json;
					resolve(lang)

				}, function(){
					//if language not found
					if (languages.length) {
						//chain request next language
						resolve(getLanguage(languages))
					} else {
						resolve({});
					}
				});
			}
		});
	};

	// default language
	var defaultLangRequest = getLanguage(['en']).then(function(lang){
		app.lang.textDefault = app.lang.languages[lang];
	});
	app.service.startupCalls.push(defaultLangRequest);

	// language detection
	if (window.navigator && navigator.languages) {

		languages = _(navigator.languages).clone();

		var localLangRequest = getLanguage(languages).then(function(lang){
			app.lang.locale = lang;
			app.lang.textLocalized = app.lang.languages[lang];
		});
		app.service.startupCalls.push(localLangRequest);
	}

})();
