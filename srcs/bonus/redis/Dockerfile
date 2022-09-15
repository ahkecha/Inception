FROM alpine:3.15

RUN apk update &&\
	apk add redis

RUN rm -rf /var/lib/{apt,dpkg,cache}/
RUN rm -rf /etc/redis.conf
ADD $PWD/conf/redis.conf /etc/redis.conf
EXPOSE 6379
ENTRYPOINT [ "redis-server", "/etc/redis.conf"]
