FROM alpine:3.15

RUN apk update && \
	apk add --no-cache php php-common php-phar php-iconv php-json \
	php-gd php-curl php-xml php-mysqli php-imap php-cgi php-pdo \
	php-soap php-posix php-gettext php-ldap php-ctype \
	php-dom tar curl php-fpm php-session curl

RUN mkdir -p /var/www/adminer
ADD $PWD/tools/entry.ash /usr/share/
RUN chmod +x /usr/share/entry.ash
RUN rm -rf /etc/php7/php-fpm.d/www.conf
ADD $PWD/conf/www.conf etc/php7/php-fpm.d/www.conf
ENTRYPOINT [ "/usr/share/entry.ash" ]
