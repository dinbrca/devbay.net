.PHONY: all clean build deploy watch

NODE-BIN 		= node_modules/.bin
TMP 			= .tmp
DIST 			= dist

CSS-SRC-PATH 		= $(TMP)/css
CSS-VENDORS-SRC-PATH 	= $(TMP)/vendor
JS-SRC-PATH 		= $(TMP)/js
JS-VENDORS-SRC-PATH	= $(TMP)/vendor

CSS-DEST-PATH 		= $(DIST)/css
JS-DEST-PATH 		= $(DIST)/js

CSS-SITE-TARGET 	= $(CSS-DEST-PATH)/site.css
CSS-SITE-PREREQ 	= $(CSS-SRC-PATH)/site.css

CSS-VENDORS-TARGET 	= $(CSS-DEST-PATH)/vendors.css
CSS-VENDORS-PREREQ 	= $(CSS-VENDORS-SRC-PATH)/normalize/**/css/*.css \
				$(CSS-VENDORS-SRC-PATH)/foundation/**/css/*.css

JS-MODERNIZR-TARGET 	= $(JS-DEST-PATH)/modernizr.js
JS-MODERNIZR-PREREQ 	= $(JS-VENDORS-SRC-PATH)/modernizr/**/js/*.js

JS-VENDORS-TARGET 	= $(JS-DEST-PATH)/vendors.js
JS-VENDORS-PREREQ 	= $(JS-VENDORS-SRC-PATH)/jquery/**/js/*.js \
				$(JS-VENDORS-SRC-PATH)/foundation/**/js/*.js

SITE-PATH		:= site
POSTS-PATH		:= $(SITE-PATH)/_posts
TOPIC 			?= new article
DATE 			:= $(shell date "+%Y-%m-%d")
FILE 			:= $(shell echo "$(POSTS-PATH)/$(DATE)-$(TOPIC).md" | sed -e 's/\(.*\)/\L\1/;y/\ /-/')

watch:	clean
	jekyll serve --config _config.yml,_config_local.yml --watch

jklocal:  clean
	jekyll build --config _config.yml,_config_local.yml

jkbuild:
	jekyll build

clean:
	rm -rf $(DIST)
	rm -rf $(TMP)

$(DIST):
	mkdir $(DIST)
	mkdir $(CSS-DEST-PATH)
	mkdir $(JS-DEST-PATH)

$(TMP):
	mkdir $(TMP)


all: 	clean 			\
	$(TMP)			\
	$(DIST) 		\
	jkbuild			\
	$(CSS-SITE-TARGET) 	\
	$(CSS-VENDORS-TARGET)	\
	$(JS-MODERNIZR-TARGET)	\
	$(JS-VENDORS-TARGET)

build:	css-site-build = $(shell cat $(CSS-SITE-TARGET) | md5sum | cut -c1-8).site.css
build:	css-vendors-build = $(shell cat $(CSS-VENDORS-TARGET) | md5sum | cut -c1-8).vendors.css
build:	js-modernizr-build = $(shell cat $(JS-MODERNIZR-TARGET) | md5sum | cut -c1-8).modernizr.js
build:	js-vendors-build = $(shell cat $(JS-VENDORS-TARGET) | md5sum | cut -c1-8).vendors.js
build:	all
	@mv $(CSS-SITE-TARGET) $(CSS-DEST-PATH)/$(css-site-build)
	@mv $(CSS-VENDORS-TARGET) $(CSS-DEST-PATH)/$(css-vendors-build)
	@mv $(JS-MODERNIZR-TARGET) $(JS-DEST-PATH)/$(js-modernizr-build)
	@mv $(JS-VENDORS-TARGET) $(JS-DEST-PATH)/$(js-vendors-build)
	@find $(TMP) -type f -iname "*.html" -exec sed -i -n '/vendors.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/css\/$(css-vendors-build)">\n/};p' {} \;
	@find $(TMP) -type f -iname "*.html" -exec sed -i -n '/site.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/css\/$(css-site-build)">\n/};p' {} \;
	@find $(TMP) -type f -iname "*.html" -exec sed -i -n '/modernizr.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/js\/$(js-modernizr-build)"><\/script>\n/};p' {} \;
	@find $(TMP) -type f -iname "*.html" -exec sed -i -n '/vendors.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/js\/$(js-vendors-build)"><\/script>\n/};p' {} \;
	@find $(TMP) -type f -iname "*.html" -exec $(NODE-BIN)/html-minifier --remove-comments --collapse-whitespace --output {} {} \;
	@cd $(TMP) && find . -type f -iname "*.html" -exec cp --parents {} ../$(DIST) \;
	@cd $(TMP) && find . -type f -iname "*.xml" -exec cp --parents {} ../$(DIST) \;
	@cd $(TMP) && find . -type f -iname "*.png" -exec cp --parents {} ../$(DIST) \;
	@cd $(TMP) && find . -type f -iname "*.gif" -exec cp --parents {} ../$(DIST) \;
	@cd $(TMP) && find . -type f -iname "*.jpg" -exec cp --parents {} ../$(DIST) \;
	@cd $(TMP) && find . -type f -iname "*.ico" -exec cp --parents {} ../$(DIST) \;
	@cd $(TMP) && find . -type f -iname "*.txt" -exec cp --parents {} ../$(DIST) \;

$(CSS-SITE-TARGET): $(CSS-SITE-PREREQ)
	@cat $^ | $(NODE-BIN)/cleancss --skip-advanced --output $@

$(CSS-VENDORS-TARGET): $(CSS-VENDORS-PREREQ)
	@cat $^ | $(NODE-BIN)/cleancss --skip-advanced --output $@

$(JS-MODERNIZR-TARGET): $(JS-MODERNIZR-PREREQ)
	@cat $^ | $(NODE-BIN)/uglifyjs --compress=warnings=false --mangle --output $@

$(JS-VENDORS-TARGET): $(JS-VENDORS-PREREQ)
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
	@s3cmd sync --acl-public --delete-removed  $(DIST)/ s3://devbay.net/

$(POSTS-PATH):
	mkdir $(POSTS-PATH)

post:	$(POSTS-PATH)
	echo "---" >> $(FILE)
	echo "layout: blog" >> $(FILE)
	echo "title: $(TOPIC)" >> $(FILE)
	echo "sitemap:" >> $(FILE)
	echo "  lastmod: $(DATE)" >> $(FILE)
	echo "---" >> $(FILE)
