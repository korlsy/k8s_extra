

sudo apt install postgresql-client-common
sudo apt install -y postgresql-client-16

psql "host=127.0.0.1 port=5433 dbname=lsy user=lsy password=lsy"
psql -W -h 127.0.0.1 -p 5433 -U lsy -d lsy

########################################################################

# 윈도우 테스트.
# Test-NetConnection -ComputerName localhost -Port 5433


포트포워딩이 제일 간단.
########################################################################
                            [ 포트포워딩 샘플 ]
                            #!/bin/sh
                            
                            STS=`ps -ef | grep "port-forward" | grep "5433"|wc -l`
                            
                            if [ $STS -gt 0 ]; then
                              echo "already running port-forward 5433:5432"
                              exit $?
                            fi
                            
                            /usr/bin/nohup \
                            kubectl --namespace mysql port-forward svc/mysql 5433:5432 \
                            >/dev/null 2>&1 &

########################################################################
    --------------------------------------------------------------------------------------
    (minikube ip : 접속해서 수행)
    sudo apt update
    sudo apt install mysql-client-core-8.0
    --------------------------------------------------------------------------------------
# 수동: 노드 IP/포트 확인
minikube ip
# → 예: 192.168.49.2
# NodePort는 service.yaml의 30306
mysql -h 192.168.49.2 -P 30306 -u lsy -p


----------------------------------------------------------------------------------------
        kubectl -n postgresql exec sts/postgresql -- \
          psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -tAc "SHOW hba_file;"
        
        # 출력 경로가 /etc/postgresql/pg_hba.conf 라면, ConfigMap 쪽을 쓰고 있는 상태
