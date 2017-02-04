# syslog-ng

This is a simple syslog-ng docker image.
It support writing log to 2 different format:
* /var/log/syslog-ng/$HOST/$HOST.log  (default)
* /var/log/syslog-ng/$YEAR-$MONTH-$DAY/$HOST.log

### Usage

Run the following command to start the container:
```sh
docker run -p 514:514 -p 514:514/udp -d maxchen021/syslog-ng
```

Run the follow command if you want to use this log format: /var/log/syslog-ng/$YEAR-$MONTH-$DAY/$HOST.log
```sh
docker run -p 514:514 -p 514:514/udp -d maxchen021/syslog-ng logformat=date
```

You can keep the log data separate from the container (replace /mnt/syslog-ng with your chosen path):
```sh
docker run -v /mnt/syslog-ng:/var/log/syslog-ng -p 514:514 -p 514:514/udp -d maxchen021/syslog-ng
```

You can also supply your own syslog-ng.conf file:
```sh
docker run -v /custom-syslog-ng.conf-path:/etc/syslog-ng/syslog-ng.conf -p 514:514 -p 514:514/udp -d maxchen021/syslog-ng
```
