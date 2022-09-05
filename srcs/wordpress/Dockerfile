FROM alpine:3.15

RUN apk update; \
	apk add --no-cache php php-common php-phar php-session php-iconv php-json \
	php-gd php-curl php-xml php-mysqli php-imap php-cgi fcgi php-pdo \
	php-pdo_mysql php-soap php-posix php-gettext php-ldap php-ctype \
	php-dom tar curl php-fpm

ADD $PWD/srcs/entry.ash /usr/local/bin/

RUN chmod +x /usr/local/bin/entry.ash
RUN mkdir -p /var/www/html

RUN ["entry.ash"]
ENTRYPOINT [ "php-fpm7", "-F" ]
