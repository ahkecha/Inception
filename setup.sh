#!/bin/bash

if [ ! -d "./data" ]; then
	mkdir -p ./data/wordpress/
	chmod -R 777 ./data/wordpress
	if [ ! -d "/tmp/mariadb" ]; then
		mkdir -m 777 /tmp/mariadb
	fi
	cd ./data
	ln -s /tmp/mariadb ./mariadb > /dev/null 2>&1
fi
