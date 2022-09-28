FROM alpine:3.15

RUN apk update && \
	apk add snort

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
