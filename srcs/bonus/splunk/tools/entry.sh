#!/bin/bash

if ! grep -q PASSWORD /opt/splunk/etc/system/local/user-seed.conf ; then
	echo "PASSWORD = $SPLUNK_PASSWD" >> /opt/splunk/etc/system/local/user-seed.conf
fi

/opt/splunk/bin/splunk start --accept-license --no-prompt > /dev/null 2>&1
echo "ℹ️  Splunk Started at port 8000"
tail -f /dev/null
