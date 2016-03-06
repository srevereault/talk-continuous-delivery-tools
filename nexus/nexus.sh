#!/bin/bash -xe

BASE_DIR=$(cd $(dirname $0); pwd)

docker run -d --name nexus-data sonatype/nexus echo "data-only container for Nexus"
