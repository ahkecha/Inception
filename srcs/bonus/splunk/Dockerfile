FROM debian:buster

RUN apt update && \
	apt install wget curl procps php-fpm -y

RUN wget -O splunk-9.0.1-82c987350fde-linux-2.6-amd64.deb "https://download.splunk.com/products/splunk/releases/9.0.1/linux/splunk-9.0.1-82c987350fde-linux-2.6-amd64.deb"
RUN dpkg -i splunk-9.0.1-82c987350fde-linux-2.6-amd64.deb
ADD $PWD/conf/user-seed.conf /opt/splunk/etc/system/local/

EXPOSE 8000 8089 9997 8088 514
ADD $PWD/tools/entry.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry.sh
ENTRYPOINT [ "/usr/local/bin/entry.sh" ]
