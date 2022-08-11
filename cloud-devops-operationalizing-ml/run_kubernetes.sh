#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=mayusb/prediction:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy prediction --image $dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods,svc,deployments
sleep 10
podname="$(kubectl get pod -o name)"

# Step 4:
# Forward the container port to a host
kubectl get pods
kubectl port-forward $podname --address 0.0.0.0 8000:80
