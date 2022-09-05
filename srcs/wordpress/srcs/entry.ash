#!/bin/ash

curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chmod +x /usr/local/bin/wp
/usr/local/bin/wp core download --allow-root --path=/var/www/html
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i -e "s/database_name_here/$DB_NAME/g" -e "s/username_here/$DB_USER/g" -e "s/password_here/$DB_PASSWD/g" -e "s/localhost/mariadb/g" /var/wordpress/wp-config.php
/usr/local/bin/wp core install --allow-root --path=/var/www/html --url=ahkecha.42.fr \
	--admin_user=admin --admin_password=admin --admin_email=admin@admin.com

if grep -Fxq "listen = 127.0.0.1:9000" /etc/php7/php-fpm.d/www.conf
then
	echo "www.conf OK"
else
	# sed -i -e 's/^listen.*=.*\/listen = 127.0.0.1:9000/' /etc/php8/php-fpm.d/www.conf
	echo "listen addr updated"
fi

