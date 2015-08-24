#!/bin/bash

FROM monapi/consul_client

# python-setuptools
RUN yum -y install python-setuptools

# Supervisor
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor

# HAProxy
RUN yum -y install haproxy tar -y

ADD bootstrap.json /etc/consul.d/bootstrap.json
RUN chmod 644 /etc/consul.d/bootstrap.json

RUN wget https://github.com/hashicorp/consul-template/releases/download/v0.9.0/consul-template_0.9.0_linux_amd64.tar.gz
RUN tar -xvzf consul-template_0.9.0_linux_amd64.tar.gz -C /opt/consul/
RUN mv /opt/consul/consul-template_0.9.0_linux_amd64 /opt/consul/consul-template
RUN rm -fr consul-template_0.9.0_linux_amd64.tar.gz