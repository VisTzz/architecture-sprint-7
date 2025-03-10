

minikube start --network-plugin=cni --cni=calico
1. kubectl run front-end-app --image=nginx --labels role=front-end --expose --port 80
2. kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port 80
3. kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port 80
4. kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port 80
5. kubectl get pods --show-labels
6. kubectl get services
7. kubectl apply -f non-admin-api-allow.yaml
    7.1 kubectl exec -it front-end-app -- curl http://admin-back-end-api-app
8. kubectl get networkpolicy
9. kubectl delete networkpolicy non-admin-api-allow -n default
10. kubectl delete networkpolicy allow-admin-api -n default