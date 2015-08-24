#!/bin/bash

FROM monapi/ha-proxy-base

ADD supervisord.conf /etc/supervisord.conf
RUN chmod 644 /etc/supervisord.conf

ADD haproxy.ctmpl /tmp/
RUN chmod 644 /tmp/haproxy.ctmpl

ADD dnsmasq.conf /etc/dnsmasq.d/10-consul
RUN chmod 644 /etc/dnsmasq.d/10-consul

ADD start.sh /start.sh
RUN  chmod +x start.sh

ADD template.sh /template.sh
RUN chmod +x template.sh

CMD ["/usr/bin/supervisord"]

EXPOSE 80