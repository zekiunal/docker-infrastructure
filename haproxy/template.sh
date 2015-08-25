#!/bin/bash

/opt/consul/consul-template/consul-template -consul 172.17.0.171:8500 -template "/tmp/haproxy.ctmpl:/etc/haproxy/haproxy.cfg:/usr/sbin/haproxy -db -f /etc/haproxy/haproxy.cfg || true"