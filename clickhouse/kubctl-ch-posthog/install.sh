
kubectl config set-context --current --namespace ch228
wget https://raw.githubusercontent.com/radondb/radondb-clickhouse-kubernetes/master/clickhouse-operator-install.yml

kubectl apply -f clickhouse-operator-install.yml

#zookeeper
kubectl --namespace ch228 apply -f zookeeper-3-node.yaml

#Install clickhouse operator
helm  --namespace ch228 repo add clickhouse-operator https://docs.altinity.com/clickhouse-operator/

helm --namespace ch228 repo update
#在新namespace安装 clickhouse-operator
helm install clickhouse-operator clickhouse-operator/altinity-clickhouse-operator \
  --namespace ch228 \
  --set nameOverride=clickhouse-operator-ch228


#clickhouse
kubectl --namespace=ch228 apply -f clickhouse-3share-2replica.yaml