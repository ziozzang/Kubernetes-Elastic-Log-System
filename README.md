# Kubernetes-Elastic-Log-System
Elastic-Stack for Logging System


# How to setup
1. You have to Make Directories /opt/elastic at target host and set owner 1000.
  * target host: specific host to using Elastic Search.
  * edit ```0.es-*.yaml``` to set kubernetes node name.
2. Edit ES_JAVA_OPTS at ```0.es-*.yaml```
3. Run Sequentially.

# Endpoint of Systems
* Elastic Search : elasticsearch-client.kube-elk:9200
* Kibana: elk-kibana.kube-elk:5601
* APM server: apm-server.kube-system:8200
* Kube-state-metrics: kube-state-metrics.kube-system:8080
