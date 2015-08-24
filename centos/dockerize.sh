#!/bin/bash

TAG="monapi/centos7"
IMAGE=$(docker images | grep "$TAG" | awk '{print $3}')

if [[ -z ${IMAGE} ]]; then
  echo "Building image"
  docker build --no-cache -t ${TAG} .
fi
