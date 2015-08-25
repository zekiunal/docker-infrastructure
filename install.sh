#!/bin/bash

if [ ! $1 ]; then
	docker rm -f $(docker ps -a -q)
    docker rmi -f $(docker images -q)
else
	NEW=$1
fi;

cd /docker-infrastructure/centos/
./dockerize.sh

cd /docker-infrastructure/consul-client/
./dockerize.sh

cd /docker-infrastructure/haproxy-base/
./dockerize.sh

cd /docker-infrastructure/consul-server/
./run.sh

CONSUL_SERVER_IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' consul_server)
echo  ${CONSUL_SERVER_IP}

#cd /docker-infrastructure/haproxy/
#./run.sh ${CONSUL_SERVER_IP}

#cd /docker-infrastructure/webserver/
#./run.sh ${CONSUL_SERVER_IP}