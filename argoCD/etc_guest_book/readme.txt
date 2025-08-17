
✅ k get pod -o wide
  👉 minikube ssh -- curl -I 10.244.1.248:8080

✅ k get svc -o wide
  👉 minikube ssh -- curl 10.109.29.137:8086


✅ 로컬 브라우저로 바로 보고 싶으면(둘 중 택1) .......................... 모두 접속 test ok
 [service 사용할때]
 👉 minikube service guestbook-ui --url
 or
  👉 kubectl port-forward deploy/etc-guestbook-ui-deployment 8088:8080 
  👉 http://localhost:8088

 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
 ✅ # 서비스가 Pod를 제대로 붙잡는지
	 👉 kubectl get endpoints guestbook-ui
	
	 👉 sangyeol@sangyeol:~/argocd_export$ kubectl get endpoints guestbook-ui
			Warning: v1 Endpoints is deprecated in v1.33+; use discovery.k8s.io/v1 EndpointSlice
			NAME           ENDPOINTS           AGE
			guestbook-ui   10.244.1.255:8080   23s
	 👉 sangyeol@sangyeol:~/argocd_export$ minikube ssh -- curl 10.244.1.255:8080
	 
 
✅ 클러스터 내부에서 서비스로 확인 .......... ok
  sangyeol@sangyeol:~$ kubectl run tmp --rm -it --image=curlimages/curl --restart=Never -- \
> curl -I http://guestbook-ui:8086
✔
 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
[ 디버깅 ]\
✅ Pod 이름 잡기 (라벨 기준)
  👉 POD=$(kubectl get po -l app=guestbook-ui -o jsonpath='{.items[0].metadata.name}')
    ✔  etc-guestbook-ui-deployment-5ff4b6dc88-88j52

✅ 파드에 에페멀(ephemeral) 컨테이너 붙여서 바로 요청 보내기
kubectl debug -it pod/$POD \
  --image=curlimages/curl:8.8.0 \
  --profile=general \
  --target=c-etc-guestbook-ui -- \
  sh -lc 'curl -I http://127.0.0.1:8080'
 
					 sangyeol@sangyeol:~/argocd_export$ kubectl debug -it pod/$POD \
					  --image=curlimages/curl:8.8.0 \
					  --profile=general \
					  --target=c-etc-guestbook-ui -- \
					  sh -lc 'curl -I http://127.0.0.1:8080'
					Targeting container "c-etc-guestbook-ui". If you don't see processes from this container it may be because the container runtime doesn't support this feature.
					Defaulting debug container name to debugger-ll875.
					HTTP/1.1 200 OK
					Server: nginx
					Date: Sun, 17 Aug 2025 05:39:58 GMT
					Content-Type: text/html
					Content-Length: 615
					Last-Modified: Wed, 13 Aug 2025 16:32:40 GMT
					Connection: keep-alive
					ETag: "689cbe28-267"
					X-Frame-Options: SAMEORIGIN
					Accept-Ranges: bytes
