#!/bin/bash

/opt/consul/consul-template/consul-template -consul 172.17.0.171:8500 -template "/tmp/haproxy.ctmpl:/etc/haproxy/haproxy.cfg:kill.sh || true"

#/usr/sbin/haproxy reload -db -f /etc/haproxy/haproxy.cfg
#/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -sf 6
#
#/usr/sbin/haproxy
#
#echo $(pgrep -f '/usr/sbin/haproxy -db -f /etc')
#
#/usr/sbin/haproxy -sf $(pgrep -f '/usr/sbin/haproxy -db -f /etc')
#
#/usr/sbin/haproxy -f haproxy.cfg -p $(</haproxy.pid) -st $(</haproxy.pid)