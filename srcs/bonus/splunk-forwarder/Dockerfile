FROM debian:buster

RUN apt update && \
	apt install curl wget procps -y

RUN wget -O splunkforwarder-9.0.1-82c987350fde-linux-2.6-amd64.deb "https://download.splunk.com/products/universalforwarder/releases/9.0.1/linux/splunkforwarder-9.0.1-82c987350fde-linux-2.6-amd64.deb"
RUN dpkg -i splunkforwarder-9.0.1-82c987350fde-linux-2.6-amd64.deb


