#!/bin/bash
echo "This command will remove your application stack!" 
echo -n "Press enter or ^c to cancel: "
read
set -x
argocd app delete grafana --yes
argocd app delete prometheus --yes

