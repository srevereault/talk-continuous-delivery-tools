#!/bin/bash -xe

BASE_DIR=$(cd $(dirname $0); pwd)

docker build -t cd/reverse-proxy $BASE_DIR

