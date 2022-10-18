FROM alpine:3.15


RUN apk update && apk add --no-cache nginx openssl \
	&& rm -rf /var/tmp/* /tmp/*

RUN  mkdir /etc/ssl/private/; openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=FR/O=42/CN=ahkecha.42.fr" \
	-addext "subjectAltName=DNS:ahkecha.42.fr" -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

RUN rm -rf /etc/nginx/http.d/*
RUN mkdir -p /var/logs/nginx
ADD $PWD/tools/entry.ash /usr/local/bin
ADD $PWD/conf/default.conf /etc/nginx/http.d/
ADD $PWD/conf/adminer.conf /etc/nginx/http.d/
ADD $PWD/conf/static.conf /etc/nginx/http.d/
RUN mkdir -p /run/nginx
RUN chmod +x /usr/local/bin/entry.ash
ENTRYPOINT [ "/usr/local/bin/entry.ash" ]
