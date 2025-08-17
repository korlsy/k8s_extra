#!/bin/sh
# minikube image load lsy-app/node-appjs
#
# cd /home/sangyeol/github_clone/k8s_extra/argoCD/etc_dev_node_appjs/image
#
# eval $(minikube docker-env)
# docker images 해서 나오는지 확인.
# docker images|grep app

docker build -t lsy-app/node-appjs .
