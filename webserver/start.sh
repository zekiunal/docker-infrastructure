#!/bin/sh

# Make sure to use all our CPUs, because Consul can block a scheduler thread
export GOMAXPROCS=`nproc`

# Get the public IP
BIND=`ifconfig eth0 | grep "inet " | awk '{ print substr($2,1) }'`

/opt/consul/consul agent -config-dir="/etc/consul.d" -data-dir="/var/consul" -join=172.17.0.171 -bind=${BIND} ${CONSUL_FLAGS} >> /var/log/consul.log 2>&1