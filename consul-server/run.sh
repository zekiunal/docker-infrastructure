#!/bin/bash

TAG="monapi/consul_server"

IMAGE=$(docker images | grep "$TAG" | awk '{print $3}')

echo "Grep result: $IMAGE"

if [[ -z ${IMAGE} ]]; then
  echo "Building image"
  docker build --no-cache -t ${TAG} .
fi

# Add following arguments to /etc/sysconfig/docker (if you are running RHEL) on machine where docker is running.
# If you are not running RHEL modify DOCKER_OPTS
#
#DOCKER_OPTS="--dns 127.0.0.1 --dns-search service.consul"

CID=$(docker run -d -p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:8600/udp --name=consul_server ${TAG})
IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${CID})
echo "Consul Server Runing at" ${IP}
CONSUL_SERVER_IP=${IP}