all: clean

clean:
	rm -rf dist
	rm -rf .tmp

watch:
	jekyll serve --config _config.yml,_config_local.yml --watch
