#!/usr/bin/env bash

# This downloads an image from Docker Hub and
# runs it as pod in Kubernetes. Additionally,
# a port forwarding from host port 8000 to
# container port 80 is enabled. A Flask app
# is running inside of the container waiting for
# JSON input: see file make_prediction.sh and app.py

# Step 1:
# This is your Docker ID/path
username="itsecat"
appname="predict-app"
tagname="try1"
dockerpath="$username/$appname:$tagname"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run "$appname" --image="$dockerpath" --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward "$appname" 8000:80 &

# Additional step:
# Attach to container's console output (application logging)
kubectl attach "$appname" &
