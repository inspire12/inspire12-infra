

kubectl config set-context $(kubectl config current-context) --namespace=mongo
export SERVICE_IP=$(kubectl get svc --namespace default my-todo-app-mean -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
