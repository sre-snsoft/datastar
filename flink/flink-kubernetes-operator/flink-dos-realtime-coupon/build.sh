#!/bin/bash

#docker 更新
docker build -t flink:dos_realtime_coupon .

docker tag flink:dos_realtime_coupon 545009824097.dkr.ecr.ap-southeast-1.amazonaws.com/flink:dos_realtime_coupon_v1

docker push 545009824097.dkr.ecr.ap-southeast-1.amazonaws.com/flink:dos_realtime_coupon_v1

# eks 启动
kubectl delete -f flink-dos-realtime-coupon.yaml
kubectl apply -f flink-dos-realtime-coupon.yaml

#网络
kubectl port-forward svc/flink-dos-realtime-coupon-rest 8081