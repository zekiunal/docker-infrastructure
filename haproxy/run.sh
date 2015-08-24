#!/bin/bash

if [ ! $1 ]; then
	echo 'Consul server ip is required'
	exit 1;
else
	NEW=$1
fi;

OLD="172.17.0.171"
NEW=$1
sed -i "s/$OLD/$NEW/g" *

TAG="monapi/haproxy"
IMAGE=$(docker images | grep "$TAG" | awk '{print $3}')

if [[ -z ${IMAGE} ]]; then
  echo "Building image"
  docker build --no-cache -t ${TAG} .
fi
CID=$(docker run -d -p 80:80 --dns 127.0.0.1 ${TAG})
IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${CID})
PORT=$(docker inspect -f '{{range $p, $conf := .NetworkSettings.Ports}}{{(index $conf 0).HostPort}}{{end}}' ${CID})
echo "HAProxy running at $IP:$PORT"

docker exec -d ${CID} /bin/bash -c 'echo "{\"service\": {\"name\": \"haproxy\", \"tags\": [\"prod\"], \"port\": '${PORT}'}}" >> /etc/consul.d/haproxy.json'
docker exec -d ${CID} /bin/bash -c 'pidof consul | xargs kill -9'