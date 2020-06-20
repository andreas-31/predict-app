# predict-app
Containerized machine learning application for deployment on a Kubernetes cluster

## CircleCI Badge
[![andreas-31](https://circleci.com/gh/andreas-31/predict-app.svg?style=svg)](https://app.circleci.com/pipelines/github/andreas-31/predict-app)

## Description of Files in the Repository
1. Dockerfile: describes the Docker container for running the machine learning app (Flask application app.py)
1. Makefile: lists steps for setup, installation, testing and linting of app.py
1. README.md: this file
1. app.py: machine learning application (Flask python framework) for predicting housing prices
1. make_prediction.sh: shell script triggering a curl command that sends a JSON request with parameters to app.py port 8000 in order to receive a price prediction in reply
1. model_data/: folder containing model and data for the machine learning algorithm
1. output_txt_files/docker_out.txt: output of the Docker container running app.py during processing of the JSON request including price prediction
1. output_txt_files/kubernetes_out.txt: output of the Kubernetes pod running app.py during processing of the JSON request including price prediction
1. output_txt_files/make_prediction_out.txt: output of the make_prediction.sh script including received price prediction
1. requirements.txt: listing of python modules required to be installed by app.py
1. run_docker.sh: script for running app.py in a Docker container by using the docker command line tool
1. run_kubernetes.sh: script for running app.py in a Kubernetes pod by using the kubectl command line tool
1. upload_docker.sh: script for uploading the created Docker image to git Docker Hub, in this case [itsecat/predict-app](https://hub.docker.com/repository/docker/itsecat/predict-app)

## Commands (run on Ubuntu 18.04.4 LTS)
Create virtual python environment

    sudo apt-get install python3-venv
    
    python3 -m venv ~/.devops 
    
    source ~/.devops/bin/activate

Download and install hadolint

    wget https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64

    mv hadolint-Linux-x86_64 hadolint

    chmod +x hadolint

    sudo install hadolint /usr/local/bin/

Installation of Requirements, Testing and Linting

    make all

Docker Hub Image

    docker pull itsecat/predict-app
    
    ./run_docker.sh
    
Kubernetes Pod

    ./run_kubernetes.sh
Please note that the script run_kubernetes.sh starts two background processes:

    kubectl port-forward "$appname" 8000:80 &
    
    kubectl attach "$appname" &
The first creates a port forwarding from host port 8000 to container port 80.
The second attaches to container's console output (application logging). It is possible that at the least the first background process must be killed in order to release host port 8000 before another run of the run_kubernetes.sh script.

### Docker Installation
```
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
$ sudo usermod -aG docker $USER && newgrp docker
$ docker run hello-world
```

### Minikube (Kubernetes) Installation
```
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
$ sudo sh -c 'echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list'
$ sudo apt update
$ sudo apt install kubectl
$ kubectl version -o json
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
$ sudo install minikube /usr/local/bin/
$ minikube start --driver=docker
```
