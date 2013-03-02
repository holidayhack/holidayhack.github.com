
BIN = ./node_modules/.bin

node_modules:
	npm install

default: node_modules
	mkdir -p public
	@echo _________________________________________________________________________________
	@echo "                                                                     JADE -> HTML"
	$(BIN)/jade < src/index.jade > public/index.html
	@echo _________________________________________________________________________________
	@echo "                                                                      STYL -> CSS"
	$(BIN)/stylus < src/site.styl > public/site.css
	$(BIN)/uglifycss public/site.css > public/site.css.tmp
	mv -f public/site.css.tmp public/site.css
	@echo _________________________________________________________________________________
	@echo "                                                                     COFFEE -> JS"
	$(BIN)/coffee --compile --stdio < src/site.coffee > public/site.js
	$(BIN)/uglifyjs --output public/site.js public/site.js
	@echo _________________________________________________________________________________
	@echo "                                                                           ASSETS"
	cp assets/v1/logo_256.png public/favicon.png
	cp assets/v1/logo_1024.png public/logo_1024.png
	cp assets/v2/logo_splash.png public/splat.png

