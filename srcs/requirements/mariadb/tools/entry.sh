#!/bin/bash

cat << EOF > /usr/share/init.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
USE ${DB_NAME};
CREATE USER IF NOT EXISTS ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* to ${DB_USER}@'%' WITH GRANT OPTION;
UPDATE mysql.user SET Password = PASSWORD('${DB_RPASSWD}') WHERE User = 'root';
UPDATE mysql.user SET plugin = '' WHERE user = 'root';
FLUSH PRIVILEGES;
EOF
/etc/init.d/mysql start
mysql_install_db --basedir=/usr --datadir=/database/mysql
mysql -u root < /usr/share/init.sql

