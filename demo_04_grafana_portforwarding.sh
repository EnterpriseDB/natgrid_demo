kubectl port-forward svc/prometheus-community-grafana 3000:80 &
echo " go to http://localhost:3000 and use admin/prom-operator to log in"
