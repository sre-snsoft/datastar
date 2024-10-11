#!/bin/bash
NS=${NAMESPACE:-signoz-otel}
echo "This command will install the analytic stack in namespace ${NS}"
echo -n "Press enter or ^c to cancel: "
read
set -x
argocd app create signoz-k8s-infra \
 --repo https://github.com/sre-snsoft/datastar.git \
 --path signoz-k8s-infra/qat-cpms-signoz-infra \
 --file override-values.yaml \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}
