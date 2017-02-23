THEMES := $(shell find themes -type f -print)
STATIC := $(shell find static -type f -print)
CONTENT := $(shell find content -type f -print)


all: build upload

build: public

public: $(THEMES) $(STATIC) $(CONTENT)
	hugo

upload: config.yml
	rm -r public_html
	cp -r public{,_html}
	scp -r public_html/ aureooms@resu5.ulb.ac.be:/home/web1343/
