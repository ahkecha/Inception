#!/bin/bash

cat << EOF > /usr/share/init.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
USE ${DB_NAME};
CREATE USER IF NOT EXISTS ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* to ${DB_USER}@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
service mysql start
mkdir -p /database/mysql
mysql_install_db --basedir=/usr --datadir=/database/mysql
mysql -e "UPDATE mysql.user SET Password = PASSWORD('password') WHERE User = 'root'"
# mysql -e "DROP DATABASE test"
mysql -e "FLUSH PRIVILEGES"
mysql -u root < /usr/share/init.sql
# sed -i '/^\[mysqld\]/a user\t= mysql\nport\t= 3306\ntmpdir\t= /tmp\nbasedir\t= /usr\ndatadir\t= /db/mysql\nsocket=\t/run/mysqld/mysqld.sock\npid-file=\t/run/mysqld/mysqld.pidbind-address\t= 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf
# rm -rf /tmp/* /var/tmp/* /usr/share/init.sql
# mysqld


