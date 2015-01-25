.PHONY: all clean build deploy watch

node-bin 		= node_modules/.bin
tmp 			= .tmp
dist 			= dist

css-src-path 		= $(tmp)/css
css-vendors-src-path 	= $(tmp)/vendor
js-src-path 		= $(tmp)/js
js-vendors-src-path	= $(tmp)/vendor

css-dest-path 		= $(dist)/css
js-dest-path 		= $(dist)/js

css-site-target 	= $(css-dest-path)/site.css
css-site-prereq 	= $(css-src-path)/site.css

css-vendors-target 	= $(css-dest-path)/vendors.css
css-vendors-prereq 	= $(css-vendors-src-path)/normalize/**/css/*.css \
				$(css-vendors-src-path)/foundation/**/css/*.css

js-modernizr-target 	= $(js-dest-path)/modernizr.js
js-modernizr-prereq 	= $(js-vendors-src-path)/modernizr/**/js/*.js

js-vendors-target 	= $(js-dest-path)/vendors.js
js-vendors-prereq 	= $(js-vendors-src-path)/jquery/**/js/*.js \
				$(js-vendors-src-path)/foundation/**/js/*.js

watch:	clean
	jekyll serve --config _config.yml,_config_local.yml --watch

clean:
	rm -rf $(dist)
	rm -rf $(tmp)

$(dist):
	mkdir $(dist)
	mkdir $(css-dest-path)
	mkdir $(js-dest-path)

$(tmp):
	jekyll build 

all: 	clean 			\
	$(tmp)			\
	$(dist) 		\
	$(css-site-target) 	\
	$(css-vendors-target)	\
	$(js-modernizr-target)	\
	$(js-vendors-target)

build:	css-site-build = $(shell cat $(css-site-target) | md5sum | cut -c1-8).site.css
build:	css-vendors-build = $(shell cat $(css-vendors-target) | md5sum | cut -c1-8).vendors.css
build:	js-modernizr-build = $(shell cat $(js-modernizr-target) | md5sum | cut -c1-8).modernizr.js
build:	js-vendors-build = $(shell cat $(js-vendors-target) | md5sum | cut -c1-8).vendors.js
build:	all
	@mv $(css-site-target) $(css-dest-path)/$(css-site-build)
	@mv $(css-vendors-target) $(css-dest-path)/$(css-vendors-build)
	@mv $(js-modernizr-target) $(js-dest-path)/$(js-modernizr-build)
	@mv $(js-vendors-target) $(js-dest-path)/$(js-vendors-build)
	@find $(tmp) -type f -iname "*.html" -exec sed -i -n '/vendors.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/css\/$(css-vendors-build)">\n/};p' {} \;
	@find $(tmp) -type f -iname "*.html" -exec sed -i -n '/site.css/{:a;N;/endbuild/!ba;N;s/.*\n/<link rel="stylesheet" href="\/css\/$(css-site-build)">\n/};p' {} \;
	@find $(tmp) -type f -iname "*.html" -exec sed -i -n '/modernizr.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/js\/$(js-modernizr-build)">\n/};p' {} \;
	@find $(tmp) -type f -iname "*.html" -exec sed -i -n '/vendors.js/{:a;N;/endbuild/!ba;N;s/.*\n/<script src="\/js\/$(js-vendors-build)">\n/};p' {} \;
	@find $(tmp) -type f -iname "*.html" -exec $(node-bin)/html-minifier --remove-comments --collapse-whitespace --output {} {} \;
	@find $(tmp) -type f -iname "*.xml" -exec $(node-bin)/html-minifier --remove-comments --collapse-whitespace --output {} {} \;
	@cd $(tmp) && find . -type f -iname "*.html" -exec cp --parents {} ../$(dist) \;
	@cd $(tmp) && find . -type f -iname "*.xml" -exec cp --parents {} ../$(dist) \;
	@cd $(tmp) && find . -type f -iname "*.png" -exec cp --parents {} ../$(dist) \;
	@cd $(tmp) && find . -type f -iname "*.jpg" -exec cp --parents {} ../$(dist) \;
	@cd $(tmp) && find . -type f -iname "*.ico" -exec cp --parents {} ../$(dist) \;
	@cd $(tmp) && find . -type f -iname "*.txt" -exec cp --parents {} ../$(dist) \;

$(css-site-target): $(css-site-prereq)
	@cat $^ | $(node-bin)/cleancss --skip-advanced --output $@

$(css-vendors-target): $(css-vendors-prereq)
	@cat $^ | $(node-bin)/cleancss --skip-advanced --output $@

$(js-modernizr-target): $(js-modernizr-prereq)
	@cat $^ | $(node-bin)/uglifyjs --compress=warnings=false --mangle --output $@

$(js-vendors-target): $(js-vendors-prereq)
	@cat $^ | $(node-bin)/uglifyjs --compress=warnings=false --mangle --output $@

deploy:	build
	find $(dist) -type f \( -iname '*.xml' -or -iname '*.txt' -or -iname '*.css' -or -iname '*.js' -or -iname '*.html' \) -exec gzip "{}" \; -exec mv "{}.gz" "{}" \;
	s3cmd sync --acl-public --exclude '*.*' --include '*.css' -m "text/css" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(dist)/css/ s3://devbay.net/css/
	s3cmd sync --acl-public --exclude '*.*' --include '*.js' -m "application/javascript" --add-header="Cache-Control: max-age=31536000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(dist)/js/ s3://devbay.net/js/
	s3cmd sync --acl-public --exclude '*.*' --include  '*.html' -m "text/html" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(dist)/ s3://devbay.net/
	s3cmd sync --acl-public --exclude '*.*' --include  '*.xml' -m "application/xml" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(dist)/ s3://devbay.net/
	s3cmd sync --acl-public --exclude '*.*' --include 'robots.txt' -m "text/plain" --add-header="Cache-Control: max-age=2592000" --add-header="Content-Encoding: gzip" --add-header="Vary: Accept-Encoding" $(dist)/ s3://devbay.net/
	s3cmd sync --acl-public --exclude '*.*' --include '*.png' -m "image/png" --add-header="Cache-Control: max-age=2592000" $(dist)/ s3://devbay.net/
	s3cmd sync --acl-public --exclude '*.*' --include '*.jpg' -m "image/jpg" --add-header="Cache-Control: max-age=2592000" $(dist)/ s3://devbay.net/
	s3cmd sync --acl-public --exclude '*.*' --include '*.ico' -m "image/vnd.microsoft.icon" --add-header="Cache-Control: max-age=2592000" $(dist)/ s3://devbay.net/
	s3cmd sync --acl-public --delete-removed  $(dist)/ s3://devbay.net/
