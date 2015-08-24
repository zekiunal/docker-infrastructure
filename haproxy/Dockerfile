#!/bin/bash

FROM monapi/consul_client

RUN yum  -y  install haproxy tar -y

ADD bootstrap.json /etc/consul.d/bootstrap.json
RUN chmod 644 /etc/consul.d/bootstrap.json

# Add runit configuration for consul
ADD consul-runit /etc/service/consul/run
RUN chmod 755 /etc/service/consul/run
RUN sed -i 's/\r//' /etc/service/consul/run
RUN echo '/etc/service/consul/run' >> /etc/rc.d/rc.local

# Add runit configuration for haproxy
ADD haproxy-runit /etc/service/haproxy/run
RUN chmod 755 /etc/service/haproxy/run
RUN sed -i 's/\r//' /etc/service/haproxy/run
RUN echo '/etc/service/haproxy/run' >> /etc/rc.d/rc.local

ADD haproxy.ctmpl /tmp/
RUN chmod 644 /tmp/haproxy.ctmpl
RUN sed -i 's/\r//' /tmp/haproxy.ctmpl

ADD dnsmasq.conf /etc/dnsmasq.d/10-consul
RUN chmod 644 /etc/dnsmasq.d/10-consul
RUN sed -i 's/\r//' /etc/dnsmasq.d/10-consul
RUN echo '/etc/dnsmasq.d/10-consul' >> /etc/rc.d/rc.local

# Add runit configuration for dnsmasq
ADD dnsmasq-runit /etc/service/dnsmasq/run
RUN chmod 755 /etc/service/dnsmasq/run
RUN sed -i 's/\r//' /etc/service/dnsmasq/run
RUN echo '/etc/service/dnsmasq/run' >> /etc/rc.d/rc.local

RUN wget https://github.com/hashicorp/consul-template/releases/download/v0.9.0/consul-template_0.9.0_linux_amd64.tar.gz
RUN tar -xvzf consul-template_0.9.0_linux_amd64.tar.gz -C /opt/consul/ && mv /opt/consul/consul-template_0.9.0_linux_amd64 /opt/consul/consul-template
RUN rm -fr consul-template_0.9.0_linux_amd64.tar.gz

# Add runit configuration for consul-template
ADD consul-template-runit /etc/service/consul-template/run
RUN chmod 755 /etc/service/consul-template/run
RUN sed -i 's/\r//' /etc/service/consul-template/run
RUN echo '/etc/service/consul-template/run' >> /etc/rc.d/rc.local

ENV HOME /root
ENTRYPOINT [ "/sbin/init" ]

EXPOSE 80
