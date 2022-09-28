#!/bin/ash

export CRT="nginx-selfsigned.crt";
if [ -f "/etc/ssl/certs/$CRT" ]
then
	echo "✅ CERT OK"
fi
export KEY="nginx-selfsigned.key";
if [ -f "/etc/ssl/private/$KEY" ]
then
	echo "✅ KEY OK"
fi

echo "🛠  wordpress at: ahkecha.42.fr"
echo "🛠  adminer at: admin.ahkecha.42.fr"
echo "🛠  Hugo at: site.ahkecha.42.fr"

sed -i 's/user nginx/user root/g' /etc/nginx/nginx.conf
nginx -g 'daemon off;'
nginx -s reload

