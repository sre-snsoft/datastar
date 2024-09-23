helm repo add signoz https://charts.signoz.io

helm --namespace signoz-otel install signoz-k8s-infra .  -f values.yaml
helm --namespace signoz-otel upgrade signoz-k8s-infra .  -f values.yaml