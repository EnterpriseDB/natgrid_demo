#!/bin/bash

# Author      : Sergio Romera
# Created     : 10/03/2022
# Description : Install secrets

. ./config_cnp.sh

if [[ ${OBJECT_STORAGE} == "AWS" ]]; then
  kubectl create secret generic aws-creds \
    --from-literal=ACCESS_KEY_ID="<access_key_id>" \
    --from-literal=ACCESS_SECRET_KEY="<access_secret_key>" \
    --from-literal=ACCESS_SESSION_TOKEN="<token>"
fi

kubectl create secret generic app-secret --from-literal=username=app --from-literal=password=app

kubectl create secret generic superuser-secret --from-literal=username=postgres --from-literal=password=admin

kubectl create secret generic minio-creds \
  --from-literal=MINIO_ACCESS_KEY=admin \
  --from-literal=MINIO_SECRET_KEY=password


