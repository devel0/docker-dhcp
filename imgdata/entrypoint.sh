#!/bin/bash

if [ ! -e /root/initialized ]; then
	echo "set ssh service"
        sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
	sed -i 's/Port 22/Port 41001/g' /etc/ssh/sshd_config

	if [ -e "/root/it-admin-root" ]; then
		echo "setup root pass"
		echo "root:`cat /root/it-admin-root`" | chpasswd
	fi

	touch /root/initialized
fi

\rm -f /var/run/dhcpd.pid

touch /var/lib/dhcp/dhcpd.leases

service rsyslog start
service isc-dhcp-server start
service ssh start

cat /var/log/syslog

tail -f /var/log/syslog

$1
