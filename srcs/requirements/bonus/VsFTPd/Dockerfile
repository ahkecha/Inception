FROM alpine:3.15

RUN apk update &&\
	apk add vsftpd

RUN rm -rf /var/lib/{apt,dpkg,cache}/
RUN rm -rf /etc/vsftpd/vsftpd.conf
ADD $PWD/conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD $PWD/conf/banner.msg /usr/share/banner.msg
ADD $PWD/tools/build.ash /usr/share/build.ash
RUN chmod +x /usr/share/build.ash
RUN mkdir -p /var/log/vsftpd
RUN touch /var/log/vsftpd/xferlog.log
EXPOSE 20 21 10090-10100
RUN mkdir -p /www/wordpress
RUN chmod 777 -R /www/wordpress
ENTRYPOINT [ "/usr/share/build.ash" ]
