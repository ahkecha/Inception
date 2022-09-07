FROM debian:buster

RUN apt update && \
	apt install mariadb-server mariadb-client procps -y && \
	apt autoclean

RUN rm -rf /var/lib/{apt,dpkg,cache,log}/
RUN /etc/init.d/mysql start
ADD $PWD/srcs/entry.sh /usr/local/bin/entry.sh
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
ADD $PWD/srcs/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
ENTRYPOINT [ "/usr/local/bin/entry.sh" ]
