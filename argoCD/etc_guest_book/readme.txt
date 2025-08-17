
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
 
✅ 클러스터 내부에서 서비스로 확인
  sangyeol@sangyeol:~$ kubectl run tmp --rm -it --image=curlimages/curl --restart=Never -- \
> curl -I http://guestbook-ui:8086