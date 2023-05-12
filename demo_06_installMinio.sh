#!/bin/bash

    printf "STEP 000\n"

. ./vars_02.sh

    printf "STEP 00X\n"

function install_minio_client() 
{
  if [ "${OBJECT_STORAGE}" == "MINIO" ]; then
    #cat install_minio_docker_client.sh | \
    #docker run --name my-mc --hostname my-mc -e hostname=`hostname` -i --entrypoint /bin/bash --rm minio/mc
    if [ `ps -edf | grep minio/minio | grep -v grep | wc -l` -eq 0 ]; then
      printf "/!\ MINIO not started\n"
      printf "Please, start MINIO (demo_07_startMinio.sh) and execute again\n"
      exit
    fi
  fi
}

function object_storage_config()
{
  
  if [ ${OBJECT_STORAGE} == "MINIO" ]; then
    install_minio_client
    
    printf "STEP 002n"
    printf "MinIO started\n"
    cp ${S3_MINIO_DIRECTORY}/*.yaml .
  fi

  if [ ${OBJECT_STORAGE} == "AWS" ]; then
    echo "AWS S3 config"
    cp ${S3_AWS_DIRECTORY}/*.yaml .
  fi
}

function replace_config()
{
    printf "STEP 005\n"

  cp ./template/${cluster_file} ./
  sed -i '' -e "s|###IMAGENAME###|${IMAGENAME}|g" cluster*.yaml
  sed -i '' -e "s|###MINIO_DESTINATIONPATH###|${MINIO_DESTINATIONPATH}|g" cluster*.yaml
  sed -i '' -e "s|###MINIO_ENDPOINTURL###|${MINIO_ENDPOINTURL}|g" cluster*.yaml

  #S3
  sed -i '' -e "s|###IMAGENAME###|${IMAGENAME}|g" cluster*.yaml
  sed -i '' -e "s|###S3_DESTINATIONPATH###|${S3_DESTINATIONPATH}|g" cluster*.yaml
}

echo "********************************"
echo "*** Configure Object Storage ***"
echo "********************************"
object_storage_config
    echo "STEP 006\n"

# set the cluster file for this example 
cluster_file="cluster-example03.yaml"
    echo "STEP 007\n"

echo "********************************************************"
echo "*** Replace config with new values from the template ***"
echo "********************************************************"
replace_config
    echo "STEP 008\n"

echo "***********************************"
echo "*** Update cluster to use Minio ***"
echo "***********************************"
echo "kubectl apply -f ${cluster_file1}"
kubectl apply -f ${cluster_file}
check_cluster()

echo "***************************"
echo "*** Show cluster status ***"
echo "***************************"
kubectl cnp status ${cluster_name}

echo "Execute this command to check the cluster status:"
echo ""
echo "kubectl cnp status ${cluster_name}"
echo ""
