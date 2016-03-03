#!/bin/bash -xe

docker rm $(docker ps -qa --filter=name=reverse-proxy) || true
docker run --name reverse-proxy \
           --net=ci-containers \
           -p 8080:80 cd/reverse-proxy



