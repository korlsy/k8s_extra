ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

# (한 번만) PV 경로 준비 - minikube VM 안
minikube ssh -- 'sudo mkdir -p /mnt/data/pv1 && sudo chmod 777 /mnt/data/pv1'

kubectl get pvc local-pvc
kubectl describe pvc local-pvc | sed -n '1,80p'   # Bound 확인
kubectl get pod pv-test-pod

# 쓰기 테스트
kubectl exec -it pv-test-pod -- sh -c 'echo hi > /data/hello && cat /data/hello'

# VM 안 실제 파일 확인(선택)
minikube ssh -- 'sudo cat /mnt/data/pv1/hello'

ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

kubectl exec -it test-pod -- sh
