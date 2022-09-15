#!/bin/ash
if ! grep -q inceftp "/etc/passwd"; then
	adduser -h /home/$FTP_USR -s /bin/false -D $FTP_USR
	echo "$FTP_USR:$FTP_PASSWD" | /usr/sbin/chpasswd > /dev/null 2>&1
	echo "[☆] Created FTP USER"
fi
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf