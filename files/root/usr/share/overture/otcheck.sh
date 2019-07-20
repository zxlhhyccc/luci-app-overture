#!/bin/sh
while :
do
	sleep 10
	if $(sed -n '$p' /var/log/overture.log |grep -q 'Send question message failed'); then
		/etc/init.d/overture restart
	fi
done
