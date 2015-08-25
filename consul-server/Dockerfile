#!/bin/bash

FROM monapi/centos7

# Install net-tools for ifconfig
RUN yum -y install net-tools

# Download consul
RUN wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip
RUN mkdir -p /opt/consul
RUN unzip 0.5.2_linux_amd64.zip -d /opt/consul
RUN rm -fr 0.5.2_linux_amd64.zip
RUN mkdir -p /var/consul
RUN mkdir -p /etc/consul.d
RUN mkdir -p /etc/service/consul

# Add bootstrap.json to /etc/consul.d directory
ADD bootstrap.json /etc/consul.d/bootstrap.json

# Change permission
RUN chmod 644 /etc/consul.d/bootstrap.json

ADD start.sh /start.sh
RUN chmod +x start.sh

CMD ["/bin/bash", "/start.sh"]

EXPOSE 8300 8301 8302 8302/udp 8400 8500 8600/udp