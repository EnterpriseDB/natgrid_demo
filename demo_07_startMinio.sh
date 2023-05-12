#!/bin/bash

. ./vars_02.sh

kubectl create secret generic minio-creds \
  --from-literal=MINIO_ACCESS_KEY=admin \
  --from-literal=MINIO_SECRET_KEY=password

# Docker Server
docker run -p 9002:9000 -p 9001:9001 \
           -e MINIO_ROOT_USER=admin \
           -e MINIO_ROOT_PASSWORD=password \
           --rm \
           minio/minio server /data2 \
           --console-address ":9001"