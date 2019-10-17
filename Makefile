.PHONY: all deploy build serv upload optimize pin clean nuke
.SECONDARY:

DEPLOYER ?= aureooms

HUGO := hugo --gc

THEMES := $(shell find themes -type f -print)
STATIC := $(shell find static -type f -print)
CONTENT := $(shell find content -type f -print)

IMAGES_KEY := $(shell sh .bin/list-images config.yml)
IMAGES_SRC := $(addprefix .cache/src/,$(IMAGES_KEY))
IMAGES_SMA := $(addprefix .cache/sma/,$(IMAGES_KEY))
IMAGES_OPT := $(addprefix .cache/opt/,$(IMAGES_KEY))

all: build

build: public

deploy: clean build upload

serv:
	$(HUGO) server

public: config.yml $(THEMES) $(STATIC) $(CONTENT)
	$(HUGO)
	sed 's:<priority>0</priority>:<priority>1</priority>:g' public/sitemap.xml -i

upload:
	scp -r public/. $(DEPLOYER)@resu5.ulb.ac.be:/home/web1343/public_html/

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
	rm -rf public

nuke: clean
	rm -rf .cache resources
