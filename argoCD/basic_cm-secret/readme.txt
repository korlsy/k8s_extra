
✅  basic-cm.yaml
  /home/sangyeol/github_clone/k8s_extra
  👉 kubectl apply -f ./argoCD/basic_cm-secret/basic-cm.yaml
  👉 k describe cm app-config
				sangyeol@sangyeol:~/github_clone/k8s_extra$ k describe cm app-config
				Name:         app-config
				Namespace:    default
				Labels:       <none>
				Annotations:  <none>
				
				Data
				====
				application.properties:
				----
				APP_MODE=dev
				APP_MESSAGE=hello-from-configmap
				
				
				LOG_LEVEL:
				----
				info
				
				
				BinaryData
				====
				
				Events:  <none>
✅  basic-secret.yaml
  👉 kubectl apply -f ./argoCD/basic_cm-secret/basic-secret.yaml
  👉  k describe secret app-secret
				sangyeol@sangyeol:~/github_clone/k8s_extra$ k describe secret app-secret
				Name:         app-secret
				Namespace:    default
				Labels:       <none>
				Annotations:  <none>
				
				Type:  Opaque
				
				Data
				====
				DB_PASS:           9 bytes
				DB_USER:           5 bytes
				credentials.json:  40 bytes

✅  basic-deployment.yaml
  👉 kubectl apply -f ./argoCD/basic_cm-secret/basic-deployment.yaml

kubectl get cm app-config -o yaml
kubectl get secret app-secret -o yaml   # data는 base64로 보임(정상)
kubectl get deploy,po

# 컨테이너 안에서 값 확인
POD=$(kubectl get po -l app=cm-secret-demo -o name)
kubectl exec -it $POD -- sh -c 'printenv | grep -E "DB_|LOG_LEVEL"'
kubectl exec -it $POD -- sh -c 'ls -l /etc/config /etc/secret && echo && cat /etc/config/application.properties && echo && cat /etc/secret/credentials.json'
