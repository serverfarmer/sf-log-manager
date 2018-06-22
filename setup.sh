#!/bin/sh
. /opt/farm/scripts/init


if [ ! -d /opt/farm/ext/farm-roles/lists/$OSVER ] || [ "$OSTYPE" = "suse" ] || [ "$OSTYPE" = "qnap" ]; then
	echo "skipping syslog configuration, unsupported system version"
elif [ "$SYSLOG" != "true" ]; then
	/opt/farm/scripts/setup/extension.sh sf-log-forwarder
else
	/opt/farm/scripts/setup/extension.sh sf-log-receiver
	/opt/farm/scripts/setup/extension.sh sf-log-monitor
fi

/opt/farm/scripts/setup/extension.sh sf-log-rotate
