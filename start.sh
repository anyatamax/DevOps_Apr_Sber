#!/bin/bash

kubectl create -f time_app/deploy/app-service.yaml

kubectl create -f time_app/deploy/app-deployment.yaml 
kubectl create -f time_app/deploy/client-deployment.yaml

minikube tunnel