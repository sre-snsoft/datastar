#!/bin/bash

#docker 更新
docker build -t flink:dos_super_jackpot-0.1.1 .

docker tag flink:dos_super_jackpot-0.1.1 545009824097.dkr.ecr.ap-southeast-1.amazonaws.com/flink:dos_super_jackpot-0.1.1

docker push 545009824097.dkr.ecr.ap-southeast-1.amazonaws.com/flink:dos_super_jackpot-0.1.1

# eks 启动
kubectl delete -f uat-flink-super-jackpot-chances.yaml
kubectl apply -f uat-flink-super-jackpot-chances.yaml

#网络
kubectl port-forward svc/flink-dos-realtime-coupon-rest 8081