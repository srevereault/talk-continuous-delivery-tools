#!/bin/bash

docker run --name postgres \
           -e POSTGRES_USER=user_rw \
           -e POSTGRES_PASSWORD=mysecretpassword \
           -e POSTGRES_DB=chat \
           -p 5432:5432 \
           postgres:9.5.1
