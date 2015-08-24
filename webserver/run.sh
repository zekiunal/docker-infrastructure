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

TAG="monapi/application"
PORT=9091
IMAGE=$(docker images | grep "$TAG" | awk '{print $3}')

if [[ -z ${IMAGE} ]]; then
  echo "Building image"
  docker build --no-cache -t ${TAG} .
fi
CID=$(docker run -d -p ${PORT} --dns 127.0.0.1 ${TAG})
IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' ${CID})
echo "Service running at $IP:$PORT"

docker exec -d ${CID} /bin/bash -c 'echo "{\"service\": {\"name\": \"app\", \"tags\": [\"prod\"], \"port\": '${PORT}'}}" >> /etc/consul.d/app.json'
docker exec -d ${CID} /bin/bash -c 'pidof consul | xargs kill -9'
