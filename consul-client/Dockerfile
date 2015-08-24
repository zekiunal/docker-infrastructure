#!/bin/bash

FROM monapi/centos7

# Install net-tools for ifconfig
RUN yum -y install net-tools

# Install dnsmasq
RUN yum -y install dnsmasq

# Download consul
RUN wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip
RUN mkdir -p /opt/consul
RUN unzip 0.5.2_linux_amd64.zip -d /opt/consul
RUN rm -fr 0.5.2_linux_amd64.zip
RUN mkdir -p /var/consul
RUN mkdir -p /etc/consul.d
RUN mkdir -p /etc/service/consul