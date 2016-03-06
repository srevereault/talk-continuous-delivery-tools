#!/bin/bash

BASE_DIR=$(cd $(dirname $0); pwd)

docker rm -f $(docker ps -aq --filter=name=gogs) 2>/dev/null || true

docker run -d --name=gogs \
           -l traefik.backend=gogs \
           -l traefik.port=3000 \
           -l traefik.frontend.rule=PathPrefixStrip \
           -l traefik.frontend.value=/gogs \
           -l traefik.frontend.passHostHeader=true \
	   --volume $BASE_DIR/data/gogs/conf:/data/gogs/conf \
           gogs/gogs
