#!/bin/bash

FROM monapi/consul_client

RUN yum -y install python-setuptools
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor

RUN yum -y install httpd

ADD bootstrap.json /etc/consul.d/bootstrap.json
RUN chmod 644 /etc/consul.d/bootstrap.json

ADD dnsmasq.conf /etc/dnsmasq.d/10-consul
RUN chmod 644 /etc/dnsmasq.d/10-consul

ADD supervisord.conf /etc/supervisord.conf
RUN chmod 644 /etc/supervisord.conf

ADD start.sh /start.sh
RUN  chmod +x start.sh

RUN grep -l 'Listen 80' /etc/httpd/conf/httpd.conf | xargs sed -e 's/Listen 80/Listen 9091/g' -i

CMD ["/usr/bin/supervisord"]

#EXPOSE 9091