#!/bin/bash

#support 2 log format: 
#/var/log/syslog-ng/$HOST/$HOST.log  (default)
#/var/log/syslog-ng/$YEAR-$MONTH-$DAY/$HOST.log
if [ "${1}" == "logformat=date" ]; then
    sed -i 's/|syslog-ng-docker-image-log-format|/$YEAR-$MONTH-$DAY/' /etc/syslog-ng/syslog-ng.conf
else
    sed -i 's/|syslog-ng-docker-image-log-format|/$HOST/' /etc/syslog-ng/syslog-ng.conf
fi

/usr/sbin/syslog-ng --no-caps -F