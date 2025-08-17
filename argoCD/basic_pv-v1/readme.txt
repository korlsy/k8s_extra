
✅ (한 번만) PV 경로 준비 - minikube VM 내부.
	minikube ssh -- 'sudo mkdir -p /mnt/data/pv1 && sudo chmod 777 /mnt/data/pv1'

	👉 minikube ssh -- 'ls /mnt/data/pv1' 
	👉 minikube ssh -- 'cat /mnt/data/pv1/hello'

✅ 쿠버네티스 디버깅.
	kubectl get pvc local-pvc
	kubectl describe pvc local-pvc | sed -n '1,80p'   # Bound 확인
	kubectl get pod pv-test-pod

	# 쓰기 테스트
	kubectl exec -it pv-test-pod -- sh -c 'echo hi > /data/hello && cat /data/hello'

	# VM 안 실제 파일 확인(선택)
	minikube ssh -- 'sudo cat /mnt/data/pv1/hello'

	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	pvc에서 storageClassName 사용하든지, 아니면 volumeName 을 명시적으로 지정하면 해당 pv로 Bound 된다.
	  storageClassName: a.b.c
	  #volumeName: local-pv
	  
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	kubectl exec -it test-pod -- sh
