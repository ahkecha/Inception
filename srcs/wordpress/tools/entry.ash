#!/bin/ash

echo "[☆] Checking wordpress installation... "

if [ -e "/usr/local/bin/wp" ]; then
	echo "[☆] WPCLI ready"
else {
	echo "[☆] Installing wordpress..."
	curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
	mv wp-cli.phar /usr/local/bin/wp > /dev/null 2>&1
	chmod +x /usr/local/bin/wp
	/usr/local/bin/wp core download --allow-root --path=/var/www/html > /dev/null 2>&1
	echo "[☆] WPcli Installed"
}
fi

if [ -e "/var/www/html/wp-config.php" ]; then
{
	echo "[☆] wp-config ready"
}
else
{
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	sed -i -e "s/database_name_here/${DB_NAME}/g" -e "s/username_here/${DB_USER}/g" -e "s/password_here/${DB_PASSWD}/g" -e "s/localhost/mariadb/g" /var/www/html/wp-config.php
	echo "[☆] DB UPDATED"
}
fi

/usr/local/bin/wp core install --allow-root --path=/var/www/html --url=ahkecha.42.fr \
	--admin_user=${WP_ADMIN} --admin_password=${WP_ADMINPASSWORD} --admin_email=admin@admin.com --title="Inception" > /dev/null 2>&1
/usr/local/bin/wp user create --allow-root --path=/var/www/html/ ${EDITOR_USR} ${EDITOR_MAIL} --role=editor --user_pass="${EDITOR_PASSWD}" --display_name='editor_user' --nickname='ed1t0r' > /dev/null 2>&1
echo "[☆] Users Created"
echo "[☆] Running php-fpm"
php-fpm7 -F -R
