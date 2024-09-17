#!/bin/bash
NS=${NAMESPACE:-clickhouse}
echo "This command will install the analytic stack in namespace ${NS}"
echo -n "Press enter or ^c to cancel: "
read
set -x
argocd app create clickhouse-operator \
 --repo https://github.com/ranmaoshu1/datastar.git \
 --path argocd/argocd-clickhouse-posthog/apps/clickhouse-operator \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

argocd app create prometheus \
 --repo https://github.com/ranmaoshu1/datastar.git \
 --path argocd/argocd-clickhouse-posthog/apps/prometheus \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

argocd app create grafana \
 --repo https://github.com/ranmaoshu1/datastar.git \
 --path argocd/argocd-clickhouse-posthog/apps/grafana \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

argocd app create zookeeper \
 --repo https://github.com/ranmaoshu1/datastar.git \
 --path argocd/argocd-clickhouse-posthog/apps/zookeeper \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

argocd app create clickhouse \
 --repo https://github.com/ranmaoshu1/datastar.git \
 --path argocd/argocd-clickhouse-posthog/apps/clickhouse \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

argocd app create cloudbeaver \
 --repo https://github.com/ranmaoshu1/datastar.git \
 --path argocd/argocd-clickhouse-posthog/apps/cloudbeaver \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

argocd app sync clickhouse-operator
argocd app sync prometheus
argocd app sync grafana
argocd app sync zookeeper
argocd app sync clickhouse
argocd app sync cloudbeaver
