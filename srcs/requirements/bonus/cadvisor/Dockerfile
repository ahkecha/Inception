FROM debian:buster

RUN apt update && \
	apt install wget curl -y

RUN curl -LO https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor
RUN chmod +x cadvisor

EXPOSE 2000
ENTRYPOINT [ "./cadvisor", "--port=2000" ]


