
BIN = ./node_modules/.bin

PUBLIC_FILES = index.html site.css site.js favicon.png logo_1024.png splat.png
FILES = $(PUBLIC_FILES:%=public/%)
TEMP_FILE = $(shell mktemp -t hoidayhack-XXX)

default: node_modules all
all: $(FILES)

node_modules:
	npm install

supervise: node_modules
	$(BIN)/supervisor -e 'coffee|styl|jade' -w . -n exit -x $(MAKE) --

public/%.html: src/%.jade
	$(BIN)/jade < $< > $@

public/%.css: src/%.styl
	$(BIN)/stylus < $< > $@
	$(BIN)/uglifycss $@ > $(TEMP_FILE)
	mv $(TEMP_FILE) $@

public/%.js: src/%.coffee
	$(BIN)/coffee --compile --stdio < $< > $@
	$(BIN)/uglifyjs --output $@ $@

public/favicon.png: assets/v1/logo_256.png
	cp $< $@
public/logo_1024.png: assets/v1/logo_1024.png
	cp $< $@
public/splat.png: assets/v2/logo_splash.png
	cp $< $@

.PHONY: node_modules all supervise default

