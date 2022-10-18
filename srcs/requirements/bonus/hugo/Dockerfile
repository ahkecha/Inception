FROM alpine:3.15

RUN apk update && \
	apk add hugo git

ADD $PWD/tools/entry.ash /usr/local/bin/
RUN rm -rf /site
RUN mkdir /site
ADD $PWD/conf/config.toml /site/
RUN chmod +x /usr/local/bin/entry.ash
ENTRYPOINT [ "/usr/local/bin/entry.ash" ]
