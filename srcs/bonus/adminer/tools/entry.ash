#!/bin/ash

FILE=/var/www/adminer/adminer.php
if [ -f "$FILE" ]; then
	echo ""
else
	cp /usr/share/adminer.php /var/www/adminer/
fi

echo "[☆] Running Adminer at port 1337"
php -q -S  0.0.0.0:1337 /var/www/adminer/adminer.php > /dev/null 2>&1
