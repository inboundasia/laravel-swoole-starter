# Build and run Application

`docker build . -t kurorido/laravel-swoole`

`docker run -d -p 1215:1215 kurorido/laravel-swoole`

now you can access http://localhost:1215

# Prepare Cloud SQL

modify `your-instance-name` in `kubernetes/deployment.yaml`

# Deploy to Kubernetes

`kubectl apply -f kubernetes/deployment.yaml`

# Make application public with Service only (LoadBalancer without static ip)

`kubectl apply -f kubernetes/service.yaml`

# Make application public with Ingress

`gcloud compute addresses create laravel-swoole-ip --global`

`gcloud compute addresses describe laravel-swoole-ip --global`

`kubectl apply -f kubernetes/ingress.yaml`

# Clean up

`kubectl delete ingress,service -l app=laravel-swoole`

`gcloud compute addresses delete laravel-swoole-ip`

`kubectl delete -f kubernetes/deployment.yaml`

# Connect to Pods

kubectl get pods -l app=laravel-swoole

kubectl exec -it laravel-swoole-deployment-85b8cddf8f-7pv9k -- /bin/sh

# References


