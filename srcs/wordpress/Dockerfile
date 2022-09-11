FROM alpine:3.15

RUN apk update; \
	apk add --no-cache php php-common php-phar php-iconv php-json \
	php-gd php-curl php-xml php-mysqli php-imap php-cgi  php-pdo \
	php-soap php-posix php-gettext php-ldap php-ctype \
	php-dom tar curl php-fpm

ADD $PWD/srcs/entry.ash /usr/local/bin/
RUN mkdir -p /var/www/html
RUN chmod 777 /var/www/html
RUN chmod +x /usr/local/bin/entry.ash
RUN rm -rf /etc/php7/php-fpm.d/www.conf
ADD $PWD/srcs/www.conf etc/php7/php-fpm.d/www.conf
ENTRYPOINT ["entry.ash"]
