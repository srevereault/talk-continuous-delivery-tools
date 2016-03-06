#!/bin/bash

BASE_DIR=$(cd $(dirname $0); pwd)

docker rm -f $(docker ps -aq --filter=name=jenkins) 2>/dev/null || true

docker run --name jenkins \
           -l traefik.backend=jenkins \
           -l traefik.port=8080\
           -l traefik.frontend.rule=PathPrefix \
           -l traefik.frontend.value=/jenkins \
           -l traefik.frontend.passHostHeader=true \
           --link traefik:ci-tools \
           jenkins:1.642.2 --prefix=/jenkins
