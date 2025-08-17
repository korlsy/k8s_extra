
kubectl apply -f basic-cm.yaml
kubectl get cm app-config -o yaml
kubectl get secret app-secret -o yaml   # data는 base64로 보임(정상)
kubectl get deploy,po

# 컨테이너 안에서 값 확인
POD=$(kubectl get po -l app=cm-secret-demo -o name)
kubectl exec -it $POD -- sh -c 'printenv | grep -E "DB_|LOG_LEVEL"'
kubectl exec -it $POD -- sh -c 'ls -l /etc/config /etc/secret && echo && cat /etc/config/application.properties && echo && cat /etc/secret/credentials.json'
