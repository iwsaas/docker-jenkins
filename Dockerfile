FROM jenkins
MAINTAINER Henry Huang <henry.s.huang@gmail.com>

COPY plugins.txt /plugins.txt
COPY plugins.sh /usr/local/bin/plugins.sh
RUN  /usr/local/bin/plugins.sh /plugins.txt
RUN  curl -s -L -f https://github.com/henrysher/docker-plugin/releases/download/docker-plugin-0.9.0p1/docker-plugin-0.9.0-SNAPSHOT.hpi -o /usr/share/jenkins/ref/plugins/docker-plugin-0.9.0-SNAPSHOT.hpi || echo "Failed to download docker-plugin:0.9.0p1"
