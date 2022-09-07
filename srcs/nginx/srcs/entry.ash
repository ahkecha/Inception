#!/bin/ash

export CRT="${CRT:=nginx-selfsigned.crt}";
if [ -f "/etc/ssl/certs/$CRT" ]
then
	echo "CERT OK"
fi
export KEY="${KEY:=nginx-selfsigned.key}";
if [ -f "/etc/ssl/private/$KEY" ]
then
	echo "KEY OK"
fi

# cat /etc/nginx/http.d/default.conf

nginx -g 'daemon off;'
nginx -s reload

