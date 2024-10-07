#!/bin/bash
NS=${NAMESPACE:-monitor}
echo "This command will install the analytic stack in namespace ${NS}"
echo -n "Press enter or ^c to cancel: "
read
set -x
argocd app create prometheus \
 --repo https://github.com/sre-snsoft/datastar.git \
 --path flink/argocd-dos-flink/apps/prometheus \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

kubectl create secret generic grafana --from-literal=username=admin --from-literal=admin-password= -n monitor
kubectl create secret generic grafana --from-literal=admin-username=admin --dry-run=client -o yaml | kubectl apply -f - -n monitor

argocd app create grafana \
 --repo https://github.com/sre-snsoft/datastar.git \
 --path flink/argocd-dos-flink/apps/grafana \
 --dest-server https://kubernetes.default.svc --dest-namespace ${NS}

argocd app sync prometheus
argocd app sync grafana

#
# echo "nvidia_smi_cmd_pod_status 0" | curl --data-binary @- http://a41093c9812b64ed7957852531a4ad74-1203801685.ap-southeast-1.elb.amazonaws.com:9091/metrics/job/prometheus-pushgateway/cluster/ops-k8s-cluster/instance/ops-k8s-2/pod_name/gpu-server-0

