✅ configmap 생성. (ttabae-config)
kubectl create configmap ttabae-config \
--from-literal=INTERVAL=2 --from-literal=OPTION=boy --from-file=config.dir/

✅ configmap 의 3가지 용도에 대해 설명, emptyDir 사용법등의 공부.
     ( 유투브 강좌 : https://www.youtube.com/watch?v=xyGTvkKzrB4&list=PLApuRlvrZKohaBHvXAOhUD-RxD0uQ3z0c&index=34)
  👉 image : smlinux/genid:env
  👉 sudo apt-get install rig boxes

  ✔ A - "genid.yaml" map 항목을 개별적으로 env로 넘김.
  ✔ B - "genid-whole.yaml" map 모든 항목을 env로 넘김.
  	kubectl exec genid-boy -- env
  		전체가 env로 바인딩 되었는지 확인
  		
  ✔ C - "genid-volume.yaml" map 항목을 마운트 시킴 (파일로 만듬)
		kubectl exec -it genid-volume -c web-server -- /bin/bash
		ls -al /etc/nginx/conf.d/
		(맵의 설정이 링크된 파일인지 확인)
		
		두개의 컨테이는 emptyDir로 하나의 공간을 공유.
		하나의 컨테이너는 index.html 파일 생산.
		하나의 컨테이너는 index.html 웹 서비스.


✅ pod 웹 서버 접속 ( k get po -o wide )
  👉 minikube ssh -- curl 10.244.2.31:80  
  👉 minikube ssh -- curl 10.244.2.32:80  
  👉 minikube ssh -- curl 10.244.2.33:80  
  
  