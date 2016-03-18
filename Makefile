.PHONY: all clean build deploy watch

NODE-BIN			= node_modules/.bin
TMP				= .tmp
SITE				= $(TMP)/site
DIST				= dist
TOOLS				= developers/tools
SCRIPTS				= scripts
DOWNLOADS			= $(TMP)/downloads
EBAY_DETAILS			= $(DOWNLOADS)/ebay-details

CSS-SRC-PATH			= $(SITE)/css
CSS-VENDORS-SRC-PATH		= $(SITE)/vendor
CSS-BOBBIE-SRC-PATH		= $(SITE)/$(TOOLS)/bobbie/css
CSS-EBAY-DETAILS-SRC-PATH 	= $(SITE)/$(TOOLS)/ebay-details/css
JS-SRC-PATH			= $(SITE)/js
JS-VENDORS-SRC-PATH		= $(SITE)/vendor
JS-BOBBIE-SRC-PATH		= $(SITE)/$(TOOLS)/bobbie/js
JS-EBAY-DETAILS-SRC-PATH 	= $(SITE)/$(TOOLS)/ebay-details/js

CSS-DEST-PATH			= $(DIST)/css
CSS-BOBBIE-DEST-PATH		= $(DIST)/$(TOOLS)/bobbie/css
CSS-EBAY-DETAILS-DEST-PATH 	= $(DIST)/$(TOOLS)/ebay-details/css
JS-DEST-PATH			= $(DIST)/js
JS-BOBBIE-DEST-PATH		= $(DIST)/$(TOOLS)/bobbie/js
JS-EBAY-DETAILS-DEST-PATH 	= $(DIST)/$(TOOLS)/ebay-details/js

CSS-SITE-TARGET			= $(CSS-DEST-PATH)/site.css
CSS-SITE-PREREQ			= $(CSS-SRC-PATH)/site.css

CSS-VENDORS-TARGET		= $(CSS-DEST-PATH)/vendors.css
CSS-VENDORS-PREREQ		= $(CSS-VENDORS-SRC-PATH)/normalize/**/css/*.css \
					$(CSS-VENDORS-SRC-PATH)/foundation/**/css/*.css

CSS-BOBBIE-TARGET		= $(CSS-BOBBIE-DEST-PATH)/app.css
CSS-EBAY-DETAILS-TARGET 	= $(CSS-EBAY-DETAILS-DEST-PATH)/app.css
CSS-BOBBIE-PREREQ		= $(CSS-BOBBIE-SRC-PATH)/*.css
CSS-EBAY-DETAILS-PREREQ 	= $(CSS-EBAY-DETAILS-SRC-PATH)/*.css

JS-MODERNIZR-TARGET		= $(JS-DEST-PATH)/modernizr.js
JS-MODERNIZR-PREREQ		= $(JS-VENDORS-SRC-PATH)/modernizr/**/js/*.js

JS-VENDORS-TARGET		= $(JS-DEST-PATH)/vendors.js
JS-VENDORS-PREREQ		= $(JS-VENDORS-SRC-PATH)/jquery/**/js/*.js \
					$(JS-VENDORS-SRC-PATH)/foundation/**/js/*.js

JS-BOBBIE-TARGET		= $(JS-BOBBIE-DEST-PATH)/app.js
JS-EBAY-DETAILS-TARGET		= $(JS-EBAY-DETAILS-DEST-PATH)/app.js
JS-BOBBIE-PREREQ		= $(JS-BOBBIE-SRC-PATH)/app.js
JS-EBAY-DETAILS-PREREQ		= $(JS-EBAY-DETAILS-SRC-PATH)/app.js

JS-BOBBIE-VENDORS-TARGET	= $(JS-BOBBIE-DEST-PATH)/vendors.js
JS-BOBBIE-VENDORS-PREREQ 	= $(JS-BOBBIE-SRC-PATH)/vendors.js

SITE-PATH		:= site
POSTS-PATH		:= $(SITE-PATH)/_posts
TOPIC 			?= new article
DATE 			:= $(shell date "+%Y-%m-%d")
FILE 			:= $(shell echo "$(POSTS-PATH)/$(DATE)-$(TOPIC).md" | sed -e 's/\(.*\)/\L\1/;y/\ /-/')
SDK-REPO		:= ../ebay-sdk-php

check_env:
	$(if $(SDK_ENV),,$(error SDK_ENV is not defined. Set in the environment via "export SDK_ENV=production"))

check_no_env:
	$(if $(SDK_ENV),$(error SDK_ENV is defined. Remove from the environment via "unset SDK_ENV"),)

watch:	check_no_env clean sdk-guides api-docs
	jekyll serve --config _config.yml,_config_local.yml --watch --host 0.0.0.0

jklocal:  check_no_env clean sdk-guides api-docs
	jekyll build --config _config.yml,_config_local.yml

jkbuild:
	jekyll build

bobbie:
	@$(NODE-BIN)/webpack --config webpack.bobbie.config.js

ebay-details:
	@$(NODE-BIN)/webpack --config webpack.ebay-details.config.js

sdk-guides:
	@cd $(SDK-REPO)/docs && make clean html
	@mkdir -p $(SITE)/sdk/guides
	@rsync -rtvu --delete --exclude .buildinfo $(SDK-REPO)/docs/_build/html/ $(SITE)/sdk/guides/ 

api-docs:
	@cd $(SDK-REPO) && make clean api
	@mkdir -p $(SITE)/sdk/guides/api
	@rsync -rtvu --delete $(SDK-REPO)/build/artifacts/docs/ $(SITE)/sdk/guides/api

clean:
	@rm -rf $(DIST)
	@rm -rf $(TMP)

$(DIST):
	@mkdir $(DIST)
	@mkdir -p $(DIST)/sdk/guides
	@mkdir -p $(DIST)/sdk/guides/api
	@mkdir $(CSS-DEST-PATH)
	@mkdir -p $(CSS-BOBBIE-DEST-PATH)
	@mkdir -p $(CSS-EBAY-DETAILS-DEST-PATH)
	@mkdir $(JS-DEST-PATH)
	@mkdir -p $(JS-BOBBIE-DEST-PATH)
	@mkdir -p $(JS-EBAY-DETAILS-DEST-PATH)

$(TMP):
	@mkdir $(TMP)

$(SITE): $(TMP)
	@mkdir $(SITE)

$(DOWNLOADS): $(TMP)
	@mkdir $(DOWNLOADS)

$(EBAY_DETAILS): $(DOWNLOADS)
	@mkdir $(EBAY_DETAILS)

download: $(DOWNLOADS) $(EBAY_DETAILS)
	@$(SCRIPTS)/download_get_ebay_details

transform:
	@$(SCRIPTS)/transform_get_ebay_details

all: 	check_env			\
	clean				\
	$(SITE)				\
	$(DIST)				\
	sdk-guides			\
	api-docs			\
	jkbuild				\
	bobbie				\
	ebay-details			\
	$(CSS-SITE-TARGET)		\
	$(CSS-VENDORS-TARGET)		\
	$(CSS-BOBBIE-TARGET)		\
	$(CSS-EBAY-DETAILS-TARGET)	\
	$(JS-MODERNIZR-TARGET)		\
	$(JS-VENDORS-TARGET)		\
	$(JS-BOBBIE-TARGET)		\
	$(JS-EBAY-DETAILS-TARGET)	\
	$(JS-BOBBIE-VENDORS-TARGET)

build:	css-site-build = $(shell cat $(CSS-SITE-TARGET) | md5sum | cut -c1-8).site.css
build:	css-vendors-build = $(shell cat $(CSS-VENDORS-TARGET) | md5sum | cut -c1-8).vendors.css
build:	css-bobbie-build = $(shell cat $(CSS-BOBBIE-TARGET) | md5sum | cut -c1-8).app.css
build:	css-ebay-details-build = $(shell cat $(CSS-EBAY-DETAILS-TARGET) | md5sum | cut -c1-8).app.css
build:	js-modernizr-build = $(shell cat $(JS-MODERNIZR-TARGET) | md5sum | cut -c1-8).modernizr.js
build:	js-vendors-build = $(shell cat $(JS-VENDORS-TARGET) | md5sum | cut -c1-8).vendors.js
build:	js-bobbie-build = $(shell cat $(JS-BOBBIE-TARGET) | md5sum | cut -c1-8).app.js
build:	js-ebay-details-build = $(shell cat $(JS-EBAY-DETAILS-TARGET) | md5sum | cut -c1-8).app.js
build:	js-bobbie-vendors-build = $(shell cat $(JS-BOBBIE-VENDORS-TARGET) | md5sum | cut -c1-8).vendors.js
build:	all
	@mv $(CSS-SITE-TARGET) $(CSS-DEST-PATH)/$(css-site-build)
	@mv $(CSS-VENDORS-TARGET) $(CSS-DEST-PATH)/$(css-vendors-build)
	@mv $(CSS-BOBBIE-TARGET) $(CSS-BOBBIE-DEST-PATH)/$(css-bobbie-build)
	@mv $(CSS-EBAY-DETAILS-TARGET) $(CSS-EBAY-DETAILS-DEST-PATH)/$(css-ebay-details-build)
	@mv $(JS-MODERNIZR-TARGET) $(JS-DEST-PATH)/$(js-modernizr-build)
	@mv $(JS-VENDORS-TARGET) $(JS-DEST-PATH)/$(js-vendors-build)
	@mv $(JS-BOBBIE-TARGET) $(JS-BOBBIE-DEST-PATH)/$(js-bobbie-build)
	@mv $(JS-EBAY-DETAILS-TARGET) $(JS-EBAY-DETAILS-DEST-PATH)/$(js-ebay-details-build)
	@mv $(JS-BOBBIE-VENDORS-TARGET) $(JS-BOBBIE-DEST-PATH)/$(js-bobbie-vendors-build)
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:css \/css\/vendors.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/css\/$(css-vendors-build)">\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:css \/css\/bobbie.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/developers\/tools\/bobbie\/css\/$(css-bobbie-build)">\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:css \/css\/ebay-details.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/developers\/tools\/ebay-details\/css\/$(css-ebay-details-build)">\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:css \/css\/site.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/css\/$(css-site-build)">\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:js \/js\/modernizr.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/js\/$(js-modernizr-build)"><\/script>\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:js \/js\/vendors.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/js\/$(js-vendors-build)"><\/script>\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:js \/js\/bobbie-vendors.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/developers\/tools\/bobbie\/js\/$(js-bobbie-vendors-build)"><\/script>\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:js \/js\/bobbie.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/developers\/tools\/bobbie\/js\/$(js-bobbie-build)"><\/script>\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec sed -i -n '/build:js \/js\/ebay-details.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/developers\/tools\/ebay-details\/js\/$(js-ebay-details-build)"><\/script>\n/};p' {} \;
	@find $(SITE) -type f -iname "*.html" -exec $(NODE-BIN)/html-minifier --remove-comments --collapse-whitespace --output {} {} \;
	@cd $(SITE) && find . -type f -iname "*.html" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find . -type f -iname "*.xml" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find . -type f -iname "*.png" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find . -type f -iname "*.gif" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find . -type f -iname "*.jpg" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find . -type f -iname "*.ico" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find . -type f -iname "*.txt" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.css" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.js" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.eot" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.svg" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.ttf" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.woff" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.otf" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.inv" -exec cp --parents {} ../../$(DIST) \;
	@cd $(SITE) && find ./sdk/guides/ -type f -iname "*.map" -exec cp --parents {} ../../$(DIST) \;

$(CSS-SITE-TARGET): $(CSS-SITE-PREREQ)
	@cat $^ | $(NODE-BIN)/cleancss --skip-advanced --output $@

$(CSS-VENDORS-TARGET): $(CSS-VENDORS-PREREQ)
	@cat $^ | $(NODE-BIN)/cleancss --skip-advanced --output $@

$(CSS-BOBBIE-TARGET): $(CSS-BOBBIE-PREREQ)
	@cat $^ | $(NODE-BIN)/cleancss --skip-advanced --output $@

$(CSS-EBAY-DETAILS-TARGET): $(CSS-EBAY-DETAILS-PREREQ)
	@cat $^ | $(NODE-BIN)/cleancss --skip-advanced --output $@

$(JS-MODERNIZR-TARGET): $(JS-MODERNIZR-PREREQ)
	@cat $^ | $(NODE-BIN)/uglifyjs --compress=warnings=false --mangle --output $@

$(JS-VENDORS-TARGET): $(JS-VENDORS-PREREQ)
	@cat $^ | $(NODE-BIN)/uglifyjs --compress=warnings=false --mangle --output $@

$(JS-BOBBIE-TARGET): $(JS-BOBBIE-PREREQ)
	@cat $^ | $(NODE-BIN)/uglifyjs --compress=warnings=false --mangle --output $@

$(JS-EBAY-DETAILS-TARGET): $(JS-EBAY-DETAILS-PREREQ)
	@cat $^ | $(NODE-BIN)/uglifyjs --compress=warnings=false --mangle --output $@

$(JS-BOBBIE-VENDORS-TARGET): $(JS-BOBBIE-VENDORS-PREREQ)
	@cat $^ | $(NODE-BIN)/uglifyjs --compress=warnings=false --mangle --output $@

deploy:	build
	@find $(DIST) -type f \( -iname '*.xml' -or -iname '*.txt' -or -iname '*.css' -or -iname '*.js' -or -iname '*.html' \) -exec gzip "{}" \; -exec mv "{}.gz" "{}" \;
	@s3cmd sync --acl-public --exclude '*.*' --include '*.css' -m "text/css" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(DIST)/css/ s3://devbay.net/css/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.js' -m "application/javascript" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(DIST)/js/ s3://devbay.net/js/
	@s3cmd sync --acl-public --exclude '*.*' --include  '*.html' -m "text/html" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(DIST)/ s3://devbay.net/
	@s3cmd sync --acl-public --exclude '*.*' --include  '*.xml' -m "application/xml" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(DIST)/ s3://devbay.net/
	@s3cmd sync --acl-public --exclude '*.*' --include 'robots.txt' -m "text/plain" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(DIST)/ s3://devbay.net/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.png' -m "image/png" --add-header="Cache-Control: max-age=2592000" $(DIST)/ s3://devbay.net/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.gif' -m "image/gif" --add-header="Cache-Control: max-age=2592000" $(DIST)/ s3://devbay.net/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.jpg' -m "image/jpg" --add-header="Cache-Control: max-age=2592000" $(DIST)/ s3://devbay.net/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.ico' -m "image/vnd.microsoft.icon" --add-header="Cache-Control: max-age=2592000" $(DIST)/ s3://devbay.net/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.css' -m "text/css" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(CSS-BOBBIE-DEST-PATH)/ s3://devbay.net/developers/tools/bobbie/css/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.css' -m "text/css" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(CSS-EBAY-DETAILS-DEST-PATH)/ s3://devbay.net/developers/tools/ebay-details/css/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.js' -m "application/javascript" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(JS-BOBBIE-DEST-PATH)/ s3://devbay.net/developers/tools/bobbie/js/
	@s3cmd sync --acl-public --exclude '*.*' --include '*.js' -m "application/javascript" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(JS-EBAY-DETAILS-DEST-PATH)/ s3://devbay.net/developers/tools/ebay-details/js/
	@s3cmd sync --acl-public --delete-removed  $(DIST)/ s3://devbay.net/

$(POSTS-PATH):
	@mkdir $(POSTS-PATH)

post:	$(POSTS-PATH)
	@echo "---" >> $(FILE)
	@echo "layout: blog" >> $(FILE)
	@echo "title: $(TOPIC)" >> $(FILE)
	@echo "sitemap:" >> $(FILE)
	@echo "  lastmod: $(DATE)" >> $(FILE)
	@echo "---" >> $(FILE)
