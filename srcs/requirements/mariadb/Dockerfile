FROM debian:buster

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWD
ARG DB_RPASSWD
RUN mkdir -p /database/mysql
RUN apt update && \
	apt install mariadb-server mariadb-client procps -y && \
	apt autoclean
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/
ADD $PWD/tools/entry.sh /usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
ADD $PWD/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN /usr/local/bin/entry.sh
ENTRYPOINT [ "mysqld" ]
