# docker build -t syslog-ng -f ./Dockerfile .

FROM debian:8
EXPOSE 514 514/udp

RUN apt-get update \
    && apt-get -y install syslog-ng

COPY build_files /tmp/docker_build_files

RUN cp /tmp/docker_build_files/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf \
    && cp /tmp/docker_build_files/docker_entrypoint.sh /docker_entrypoint.sh \
    && chmod 755 /docker_entrypoint.sh \
    && rm -rf /tmp/docker_build_files

ENTRYPOINT ["/docker_entrypoint.sh"]

