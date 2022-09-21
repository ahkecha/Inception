#!/bin/ash

FILE=/var/www/adminer/index.php
if [ -f "$FILE" ]; then
	echo ""
else
	curl -LO https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php > /dev/null 2>&1
	mv adminer-4.8.1.php /var/www/adminer/index.php
fi

php-fpm7 -F -R
