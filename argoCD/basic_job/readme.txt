cd /home/sangyeol/github_clone/k8s_extra

✅  요약
  👉 Job → 한 번만 실행되는 일 (배치 처리, 마이그레이션 등)
  👉 CronJob → 주기적으로 반복되는 일 (로그 정리, 백업 등)
  
✅  JOB 실행  
	# 배포
	kubectl apply -f demo-job.yaml
	
	# Job 상태 확인
	kubectl get jobs
	
	# Job에서 생성된 Pod 확인
	kubectl get pods
	
	# 로그 확인 (Pod 이름은 위에서 확인)
	kubectl logs <pod-name>

✅  Cron JOB 실행  
	# 배포
	kubectl apply -f demo-cronjob.yaml
	
	# CronJob 확인
	kubectl get cronjob
	
	# 생성된 Job 확인 (1분마다 새 Job 생성)
	kubectl get jobs
	
	# 생성된 Pod 확인
	kubectl get pods --watch
	
	# 로그 확인
	kubectl logs <pod-name>
