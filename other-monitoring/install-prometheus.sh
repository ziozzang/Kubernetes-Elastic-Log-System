#!/bin/bash


#- Prometheus
helm install stable/prometheus --name prometheus --namespace kube-monitor
helm install stable/prometheus-operator --name prometheus-operator --namespace kube-monitor

#wait_pod_up prometheus-server kube-monitor 1

#- Grafana
helm install stable/grafana --name grafana --namespace kube-monitor
TOKEN=`kubectl get secret --namespace kube-monitor grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`
echo "${TOKEN}" > ${HOME}/.token/grafana
