#!/bin/ash

if [ -e "/usr/local/bin/wp" ]; then
	echo "WPCLI ready"
else {
	curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	chmod +x /usr/local/bin/wp
	/usr/local/bin/wp core download --allow-root --path=/var/www/html
}
fi

if [ -e "/var/www/html/wp-config.php" ]; then
{
	sed -i -e "s/database_name_here/wordpress/g" -e "s/username_here/user1/g" -e "s/password_here/user123/g" -e "s/localhost/mariadb/g" /var/www/html/wp-config.php
	echo "DB UPDATED"
}
else
{
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	sed -i -e "s/database_name_here/wordpress/g" -e "s/username_here/user1/g" -e "s/password_here/user123/g" -e "s/localhost/mariadb/g" /var/www/html/wp-config.php
}
fi

/usr/local/bin/wp core install --allow-root --path=/var/www/html --url=ahkecha.42.fr \
	--admin_user=admin --admin_password=admin --admin_email=admin@admin.com --title="Wordpress Website test"

echo "Running php-fpm"
php-fpm7 -F -R
