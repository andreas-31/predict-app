# predict-app
Containerized machine learning application for deployment on a Kubernetes cluster

## CircleCI Badge
[![andreas-31](https://circleci.com/gh/andreas-31/predict-app.svg?style=svg)](https://app.circleci.com/pipelines/github/andreas-31/predict-app)

## Description of Files in the Repository
1. Dockerfile
1. Makefile
1. README.md
1. app.py
1. make_prediction.sh
1. model_data/
1. output_txt_files/docker_out.txt
1. output_txt_files/kubernetes_out.txt
1. output_txt_files/make_prediction_out.txt
1. requirements.txt
1. run_docker.sh
1. run_kubernetes.sh
1. upload_docker.sh

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
