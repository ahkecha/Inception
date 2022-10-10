#!/bin/bash

# echo "Setting up volumes directories and appropriate permissions for ftp"
if [ ! -f "./srcs/data/.success" ]; then
	mkdir -p ./srcs/data
	if [ ! -d "/tmp/mariadb" ]; then
		mkdir -m 777 /tmp/mariadb
	fi
	if [ ! -d "/tmp/wordpress" ]; then
		mkdir -m 777 /tmp/wordpress
	fi
	cd ./srcs/data
	ln -s /tmp/mariadb ./srcs/data/mariadb > /dev/null 2>&1
	ln -s /tmp/wordpress ./srcs/data/wordpress > /dev/null 2>&1
	echo '1' > ./.success
fi
