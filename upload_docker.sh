#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
username=itsecat
appname=predict-app
dockerpath="$username/$appname"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username "$username"
docker tag "$appname" "$dockerpath:try1"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
