FROM debian:buster

RUN apt update && \
	apt install wget curl -y

RUN curl -LO https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor
RUN chmod +x cadvisor
ADD $PWD/tools/entry.sh	/usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh
ENTRYPOINT [ "/usr/local/bin/entry.sh" ]


