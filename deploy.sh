#!/usr/bin/bash
kubectl apply -f haproxy-controller-devops.yaml

for file in *
do
if [ "$file" != "delete haproxy.sh" ]
then
  if [ "$file" != "run-all-k8s.sh" -a "$file" != "haproxy-controller-devops.yaml" ]
  then
    kubectl apply -f "$file"
  fi
fi
done




