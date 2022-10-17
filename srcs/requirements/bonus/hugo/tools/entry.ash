#!/bin/ash

if [ ! -d "/static/site" ]; then
	cd /static
	hugo new site site > /dev/null 2>&1
	cd /static/site
	git init > /dev/null 2>&1
	git submodule add https://github.com/Yukuro/hugo-theme-shell.git themes/hugo-theme-shell > /dev/null 2>&1
	rm -rf /static/site/config.toml
	cp /site/config.toml /static/site/
fi
cd /static/site
echo "ℹ️  Running Hugo server"
hugo server --bind=0.0.0.0 --port=1313 -t hugo-theme-shell > /dev/null 2>&1
