#! /bin/bash
# https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/

kubectl apply -f ./grafana.yml
kubectl port-forward service/grafana 8030:3000