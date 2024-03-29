#!/bin/bash


cat << EOF > /usr/share/init.sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_RPASSWD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* to ${DB_USER}@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql
service mysql start
mysql -u root < /usr/share/init.sql


