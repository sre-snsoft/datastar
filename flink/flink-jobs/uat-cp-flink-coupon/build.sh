#!/bin/bash

#docker 更新
docker build -t flink:uat-cp-flink-coupon-v2 .

docker tag flink:uat-cp-flink-coupon-v2 545009824097.dkr.ecr.ap-southeast-1.amazonaws.com/flink:uat-cp-flink-coupon-v2

docker push 545009824097.dkr.ecr.ap-southeast-1.amazonaws.com/flink:uat-cp-flink-coupon-v2

# eks 启动
kubectl delete -f flink-dos-realtime-coupon.yaml
kubectl apply -f flink-dos-realtime-coupon.yaml

#网络
kubectl port-forward svc/flink-dos-realtime-coupon-rest 8081