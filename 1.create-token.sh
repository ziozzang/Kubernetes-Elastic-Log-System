#!/bin/bash

cat << EOF | kubectl create -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: beats-token
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: beats-token
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: beats-token
  namespace: kube-system
EOF

TOKEN=`kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep beats-token | awk '{print $1}') | grep -i "^token:" | awk '{print $2}'`
echo "${TOKEN}"
cat << EOF | kubectl create -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: metric-tokens
  namespace: kube-system
  labels:
    k8s-app: metric-tokens
data:
  metric-token: |-
    ${TOKEN}
EOF
