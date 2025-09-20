########################################################################
포트포워딩이 제일 간단.


kubectl -n mysql port-forward svc/mysql 3307:3306
mysql -h 127.0.0.1 -P 3307 -u lsy -plsy --connect-timeout=5 --protocol=TCP

# 윈도우 테스트.
# Test-NetConnection -ComputerName localhost -Port 3307


########################################################################
                            [ 포트포워딩 샘플 ]
                            #!/bin/sh
                            
                            STS=`ps -ef | grep "port-forward" | grep "3307"|wc -l`
                            
                            if [ $STS -gt 0 ]; then
                              echo "already running port-forward 3307:3306"
                              exit $?
                            fi
                            
                            /usr/bin/nohup \
                            kubectl --namespace mysql port-forward svc/mysql 3307:3306 \
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


