# build and deploy in specifics namespace in k8
## Staging 
```
kubectl create -f yaml/service-deployment.yaml -n staging
kubectl apply -f yaml/service-deployment.yaml -n staging

```
## Production
```
kubectl create -f yaml/service-deployment.yaml -n production
kubectl apply -f yaml/service-deployment.yaml -n production
```

