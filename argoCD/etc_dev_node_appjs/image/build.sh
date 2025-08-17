#!/bin/sh
# minikube image load lsy-app/node-appjs
# /home/sangyeol/github_clone/k8s_extra/argoCD/etc_dev_node_appjs/image

docker build -t lsy-app/node-appjs .
