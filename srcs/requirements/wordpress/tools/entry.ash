#!/bin/ash

echo "ℹ️  Checking wordpress installation... "

if [ -e "/usr/local/bin/wp" ]; then
	echo "ℹ️  WPCLI ready"
	/usr/local/bin/wp core download --allow-root --path=/var/www/html > /dev/null 2>&1
else {
	echo "ℹ️  Installing wordpress..."
	curl -LO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
	mv wp-cli.phar /usr/local/bin/wp > /dev/null 2>&1
	chmod +x /usr/local/bin/wp
	echo "ℹ️  WPcli Installed"
	/usr/local/bin/wp core download --allow-root --path=/var/www/html > /dev/null 2>&1
}
fi

if [ ! -e "/var/www/html/wp-config.php" ]; then
{
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	sed -i -e "s/database_name_here/${DB_NAME}/g" -e "s/username_here/${DB_USER}/g" -e "s/password_here/${DB_PASSWD}/g" -e "s/localhost/mariadb/g" /var/www/html/wp-config.php
	echo "ℹ️  DB UPDATED"
}
fi

/usr/local/bin/wp core install --allow-root --path=/var/www/html --url=ahkecha.42.fr \
	--admin_user=${WP_ADMIN} --admin_password=${WP_ADMINPASSWORD} --admin_email=admin@admin.com --title="Inception" > /dev/null 2>&1

if ! grep -q randominception /var/www/html/wp-config.php ; then
	python3 /usr/local/bin/redis.py
fi

if ! wp plugin is-installed redis-cache --allow-root --path=/var/www/html; then
	/usr/local/bin/wp plugin install redis-cache --activate --path=/var/www/html --allow-root > /dev/null 2>&1
	/usr/local/bin/wp redis enable --path=/var/www/html --allow-root > /dev/null 2>&1
	echo "✅ Installed redis-cache"
fi

if ! /usr/local/bin/wp user list --allow-root --path=/var/www/html/ | grep -q ${EDITOR_USR} > /dev/null; then
	/usr/local/bin/wp user create --allow-root --path=/var/www/html/ ${EDITOR_USR} ${EDITOR_MAIL} --role=editor --user_pass="${EDITOR_PASSWD}" --display_name='editor_user' --nickname='ed1t0r' > /dev/null 2>&1
	echo "✅ Users Created"
fi

if ! /usr/local/bin/wp theme list --allow-root --path=/var/www/html/ | grep -q uniblock; then
	/usr/local/bin/wp theme install uniblock --allow-root --path=/var/www/html/ > /dev/null 2>&1
	/usr/local/bin/wp theme activate uniblock  --allow-root --path=/var/www/html/ > /dev/null 2>&1
fi
echo "ℹ️  Running php-fpm"
php-fpm7 -F -R
