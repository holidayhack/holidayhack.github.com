default: all
all: out/index.html out/site.js out/site.css
out/site.css: src/site.styl
	stylus < src/site.styl > public/site.css
out/index.html: src/index.jade
	jade < src/index.jade > public/index.html
out/site.js: src/site.coffee
	coffee --compile src/site.coffee -o public/
