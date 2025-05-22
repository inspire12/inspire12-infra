kubectl apply -f ns.yml
kubectl apply -f elasticsearch-configmap.yml
kubectl apply -f elasticsearch-persistentvolume.yml
kubectl apply -f elasticsearch-statefulset.yml
kubectl apply -f elasticsearch-service.yml

