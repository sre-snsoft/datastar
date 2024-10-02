helm repo add signoz https://charts.signoz.io

helm --namespace signoz-otel install signoz-k8s-infra .  -f values.yaml
helm --namespace signoz-otel upgrade signoz-k8s-infra .  -f values.yaml



#测试验证
otel/otelcol
docker run --rm -p 4317:4317 -p 4318:4318 -p 55681:55681 \
  -v "$(pwd)/otel-config.yaml":/otel-config.yaml \
  otel/opentelemetry-collector:latest --config /otel-config.yaml

#发送测试数据
cat log.txt | while read line; do
  curl -X POST -d "$line" -H "Content-Type: application/x-otlp" http://localhost:4318/v1/logs
done