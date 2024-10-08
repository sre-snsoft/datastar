#!/bin/bash
NS=${NAMESPACE:-clickhouse}
echo "This command will forward ports on the analytic stack in namespace ${NS}"
echo -n "Press enter or ^c to cancel: "
read
set -x
# Port-forward for CloudBeaver SQL editor.
kubectl port-forward svc/cloudbeaver -n ${NS} 8978:8978 &
# Port-forward for Grafana dashboard.
kubectl port-forward svc/grafana -n ${NS} 3000:3000 &
# Port-forward for ClickHouse web UI.
kubectl port-forward svc/clickhouse-argocd -n ${NS} 8123:8123 &

posthog
  - vpc-0895c2909f084b4db
  - 10.180.0.0/16

clickhouse-posthog
  - vpc-0969c50d0afa41f45
  - 10.196.0.0/16
