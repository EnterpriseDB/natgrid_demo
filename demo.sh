kind create cluster --name $cluster_name --config $kind_config

curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/calico.yaml -O
kubectl apply -f calico.yaml

helm repo add prometheus-community \
  https://prometheus-community.github.io/helm-charts

helm upgrade --install \
  -f https://raw.githubusercontent.com/EnterpriseDB/docs/main/product_docs/docs/postgres_for_kubernetes/1/samples/monitoring/kube-stack-config.yaml \
  prometheus-community \
  prometheus-community/kube-prometheus-stack

kubectl apply -f postgresql-operator-1.20.0.yaml
k apply -f cluster-example01.yaml

