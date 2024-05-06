#!/bin/bash

# on Mac Os
curl -L https://istio.io/downloadIstio | sh -
export PATH="$PATH:$PWD/istio-1.21.2/bin"
istioctl install -y --set profile=demo --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
kubectl label namespace default istio-injection=enabled

git clone https://github.com/prometheus-operator/kube-prometheus.git
kubectl apply --server-side -f kube-prometheus/manifests/setup
kubectl apply -f kube-prometheus/manifests/

kubectl create -f time_app/deploy/app-service.yaml

kubectl create -f time_app/deploy/app-deployment.yaml 
kubectl create -f time_app/deploy/client-deployment.yaml
kubectl create -f time_app/deploy/metrics-deployment.yaml

kubectl create -f time_app/deploy/gateway.yaml
kubectl create -f time_app/deploy/virtualservice.yaml
kubectl create -f time_app/deploy/external-service.yaml
kubectl create -f time_app/deploy/exporter-service.yaml
kubectl create -f time_app/deploy/exporter-servicemonitor.yaml

minikube tunnel