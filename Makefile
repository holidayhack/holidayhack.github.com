default:
	mkdir -p public
	@echo ________________________________________
	@echo                             JADE -\> HTML
	jade < src/index.jade > public/index.html
	@echo ________________________________________
	@echo                              STYL -\> CSS
	stylus < src/site.styl > public/site.css
	uglifycss public/site.css > public/site.css.tmp
	mv -f public/site.css.tmp public/site.css
	@echo ________________________________________
	@echo                             COFFEE -\> JS
	coffee --compile --stdio < src/site.coffee > public/site.js
	uglifyjs --overwrite public/site.js
	@echo ________________________________________
	@echo                                   ASSETS
	cp assets/v1/logo_256.png public/favicon.png
	cp assets/v1/logo_1024.png public/logo_1024.png
	cp assets/v2/logo_splash.png public/splat.png
