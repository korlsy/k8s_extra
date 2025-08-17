
cd /home/sangyeol/github_clone/k8s_extra

✅  basic-cm.yaml
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


✅  스키마 검증
  👉 kubectl apply --dry-run=client -f basic-cm.yaml
  👉 kubectl apply --dry-run=client -f basic-secret.yaml
  👉 kubectl apply --dry-run=client -f basic-deployment.yaml

✅  적용
  👉 kubectl apply -f basic-cm.yaml -f basic-secret.yaml -f basic-deployment.yaml

✅  확인
  👉 kubectl get po -l app=cm-secret-demo
  👉 kubectl exec -it deploy/cm-secret-demo -- sh -c 'printenv | grep -E "DB_|LOG_LEVEL"'
  👉 kubectl exec -it deploy/cm-secret-demo -- sh -lc "cat /etc/config/application.properties && echo && cat /etc/secret/credentials.json"
