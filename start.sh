#!/bin/bash

# on Mac Os
curl -L https://istio.io/downloadIstio | sh -
export PATH="$PATH:$PWD/istio-1.21.2/bin"
istioctl install -y --set profile=demo --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
kubectl label namespace default istio-injection=enabled

kubectl create -f time_app/deploy/app-service.yaml

kubectl create -f time_app/deploy/app-deployment.yaml 
kubectl create -f time_app/deploy/client-deployment.yaml

kubectl create -f time_app/deploy/gateway.yaml
kubectl create -f time_app/deploy/virtualservice.yaml
kubectl create -f time_app/deploy/external-service.yaml

minikube tunnel