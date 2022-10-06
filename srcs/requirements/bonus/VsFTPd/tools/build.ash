#!/bin/ash

if ! grep -q $FTP_USR "/etc/passwd"; then
	adduser -h /home/$FTP_USR -s /bin/false -D $FTP_USR
	echo "$FTP_USR:$FTP_PASSWD" | /usr/sbin/chpasswd > /dev/null 2>&1
	echo "ℹ️  Created FTP USER"
fi
echo "ℹ️  Running FTP server"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
