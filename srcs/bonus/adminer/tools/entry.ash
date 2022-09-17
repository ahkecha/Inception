#!/bin/ash

FILE=/var/www/adminer/adminer.php
if [ -f "$FILE" ]; then
	echo ""
else
	cp /usr/share/adminer.php /var/www/adminer/index.php
fi

# echo "[☆] Running Adminer at port 1337"
php-fpm7 -F -R
