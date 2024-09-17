helm repo add signoz https://charts.signoz.io

helm install my-release-k8s-infra signoz/k8s-infra \
  -f signoz-k8s-infra.override-values.yaml