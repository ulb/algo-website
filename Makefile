.PHONY: all build serv upload optimize pin clean
.SECONDARY:

THEMES := $(shell find themes -type f -print)
STATIC := $(shell find static -type f -print)
CONTENT := $(shell find content -type f -print)

IMAGES_KEY := $(shell sh .bin/list-images config.yml)
IMAGES_SRC := $(addprefix .cache/src/,$(IMAGES_KEY))
IMAGES_SMA := $(addprefix .cache/sma/,$(IMAGES_KEY))
IMAGES_OPT := $(addprefix .cache/opt/,$(IMAGES_KEY))

all: build upload

build: public

serv:
	hugo server

public: config.yml $(THEMES) $(STATIC) $(CONTENT)
	hugo
	sed 's:<priority>0</priority>:<priority>1</priority>:g' public/sitemap.xml -i

upload:
	rm -rf public_html
	cp -r public{,_html}
	scp -r public_html/ aureooms@resu5.ulb.ac.be:/home/web1343/

optimize: $(IMAGES_OPT)
	@sh .bin/update-config config.yml $^

.cache/src/%:
	@mkdir -p $(dir $@)
	ipfs get $(notdir $@) -o $@

.cache/sma/%: .cache/src/%
	@mkdir -p $(dir $@)
	sh .bin/resize-image $< $@

.cache/opt/%: .cache/sma/%
	@mkdir -p $(dir $@)
	cp $< $@
	sh .bin/optimize-image $@

pin: config.yml
	@sh .bin/list-images $< | sh .bin/pin-images

clean:
	rm -rf public{,_html} .cache resources
