#!/bin/ash

cat << EOF > /usr/share/init.sql
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWD';
GRANT ALL PRIVILEGES ON '$DB_NAME.*' to '$DB_USER'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'%' IDENTIFIED WITH '$DB_RPASSWD' BY '';
FLUSH PRIVILEGES;
EOF
touch /run/openrc/softlevel
/etc/init.d/mariadb start
/usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql/

mysql -u root < /usr/share/init.sql

sed -i '/^\[mysqld\]/a user\t= mysql\nport\t= 3306\ntmpdir\t= /tmp\nbasedir\t= /usr\ndatadir\t= /var/lib/mysql\nbind-address\t= 0.0.0.0' /etc/my.cnf.d/mariadb-server.cnf
rm -rf /tmp/* /var/tmp/* /usr/share/init.sql

cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

