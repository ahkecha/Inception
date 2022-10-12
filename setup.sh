#!/bin/bash

# echo "Setting up volumes directories and appropriate permissions for ftp"
if [ ! -f "/home/ahkecha/data/.success" ]; then
	mkdir -p /home/ahkecha/data/mariadb -m 777
	mkdir -p /home/ahkecha/data/wordpress -m 777
	mkdir -p /home/ahkecha/data/nginx -m 777
	mkdir -p /home/ahkecha/data/adminer -m 777
	mkdir -p /home/ahkecha/data/hugo -m 777
	echo '1' > /home/ahkecha/data/.success
fi
