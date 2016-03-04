#!/bin/bash

BASE_DIR=$(cd $(dirname $0); pwd)

docker run  -p 8080:8080 -p 80:80 \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v $BASE_DIR/traefik.toml:/etc/traefik/traefik.toml \
            containous/traefik
