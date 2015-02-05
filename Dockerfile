FROM phusion/baseimage:0.9.16
MAINTAINER Arthur Axel fREW Schmdit <frioux@gmail.com>

CMD ["/sbin/my_init"]
VOLUME ["/opt/var", "/opt/log"]
EXPOSE 8080 22000

ADD ./app.sh /etc/service/syncthing/run
ADD ./log.sh /etc/service/syncthing/log/run

RUN env DEBIAN_FRONTEND=noninteractive apt-get update \
 && useradd user \
 && chown 1000:1000 /opt/var /home/user \
 && apt-get install --no-install-recommends -y \
    daemontools                                \
    sudo                                       \
 && wget https://github.com/syncthing/syncthing/releases/download/v0.10.21/syncthing-linux-amd64-v0.10.21.tar.gz \
 && tar xvf syncthing-linux-amd64-v0.10.21.tar.gz \
 && mv syncthing-linux-amd64-v0.10.21/syncthing /usr/bin/syncthing
