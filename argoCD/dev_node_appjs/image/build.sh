#!/bin/sh
#docker build -t lsy-linux/appjs .
minikube image build -t lsy-linux/appjs .

# minikube image load lsy-linux/appjs