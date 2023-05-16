#!/bin/bash

# See https://kind.sigs.k8s.io/docs/user/ingress#ingress-nginx
. ./vars_02.sh

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

