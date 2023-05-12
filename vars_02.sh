#!/bin/bash

export cluster_name="cnp-kind-ngdemo"
export project_name="natgrid_demo"
export yaml_file="cluster-example.yaml"
export kind_config="kind_config.yaml"
export project_home=/Users/ashley.silver/Desktop/$project_name

export version="1.20.0"
export plugging="https://github.com/EnterpriseDB/kubectl-cnp/raw/main/install.sh"
export operator="https://get.enterprisedb.io/cnp/postgresql-operator-${version}.yaml"

export S3_MINIO_DIRECTORY="./S3_MINIO"
export S3_AWS_DIRECTORY="./S3_AWS"
# MINIO or AWS
export OBJECT_STORAGE="MINIO"
export IMAGENAME="quay.io/enterprisedb/postgresql:14.4"
# AWS S3
export S3_DESTINATIONPATH="s3://sergiocnp/cnp/dr"
export s3_cluster1="s3://sergiocnp/cnp/dr/cluster1"
export s3_cluster2="s3://sergiocnp/cnp/dr/cluster2"

# MinIO config
export HOSTNAME=$(ifconfig -a|grep 10.0.0 |head -n1|awk '{print $2}')
export MINIO_DESTINATIONPATH="s3://cnp/"
export MINIO_PORT=9002
export MINIO_ENDPOINTURL="http://${HOSTNAME}:${MINIO_PORT}"

# **************
# *** Colors ***
# **************
c_r="\e[0m" #reset color
c_green="\e[32m"
c_red="\e[31m"
c_default="\e[39m"
