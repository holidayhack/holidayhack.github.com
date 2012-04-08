default: all
all: out/index.html out/site.js out/site.css out/favicon.png out/splat.png

out/site.css: src/site.styl
	mkdir -p public
	stylus < src/site.styl > public/site.css
	uglifycss public/site.css > public/site.css.tmp
	mv -f public/site.css.tmp public/site.css

out/index.html: src/index.jade
	mkdir -p public
	jade < src/index.jade > public/index.html

out/site.js: src/site.coffee
	mkdir -p public
	coffee --compile --stdio < src/site.coffee > public/site.js
	uglifyjs --overwrite public/site.js

out/favicon.png: assets/logo_mid_darkred.png
	cp assets/logo_mid_darkred.png public/favicon.png
out/splat.png: assets/logo_splash.png
	cp assets/logo_splash.png public/splat.png
