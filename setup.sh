#!/bin/bash

if [ ! -d "./data/.success" ]; then
	mkdir ./data
	if [ ! -d "/tmp/mariadb" ]; then
		mkdir -m 777 /tmp/mariadb
	fi
	if [ ! -d "/tmp/wordpress" ]; then
		mkdir -m 777 /tmp/wordpress
	fi
	cd ./data
	ln -s /tmp/mariadb ./mariadb > /dev/null 2>&1
	ln -s /tmp/wordpress ./wordpress > /dev/null 2>&1
	echo '1' > ./.success
fi
