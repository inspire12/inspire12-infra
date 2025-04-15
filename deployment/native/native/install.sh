// PGP key 및 APT repository 설정
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

// ES 패키지 설치
sudo apt-get update && sudo apt-get install elasticsearch

// 시스템 재시작 시 자동 실행되도록 설정
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service

sudo vim /usr/lib/systemd/system/elasticsearch.service
...
# Specifies the maximum file descriptor number that can be opened by this process
LimitNOFILE=655350

# Specifies the maximum number of processes
LimitNPROC=655360

# Specifies the max locked-in-memory address space
LimitMEMLOCK=infinity
...

sudo vim /etc/sysctl.conf
...
net.core.netdev_max_backlog=30000
net.core.somaxconn=1024
net.core.rmem_default=253952
net.core.wmem_default=253952
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=253952 253952 16777216
net.ipv4.tcp_wmem=253952 253952 16777216

vm.swappiness=1
vm.max_map_count=262144
...

sudo systemctl start elasticsearch
sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -i -u elastic
This tool will reset the password of the [elastic] user.
You will be prompted to enter the password.
Please confirm that you would like to continue [y/N]y
 
Enter password for [elastic]: abcde12#
Re-enter password for [elastic]: abcde12#
Password for the [elastic] user successfully reset.
 
// 기본 indices 삭제
sudo systemctl stop elasticsearch
sudo rm -rf /var/lib/elasticsearch/*

sudo vim /etc/elasticsearch/elasticsearch.yml
...
# ---------------------------------- Cluster -----------------------------------
#
# Use a descriptive name for your cluster:
#
cluster.name: faip-dev-es
#
# ------------------------------------ Node ------------------------------------
#
# Use a descriptive name for the node:
#
node.name: ${HOSTNAME}
node.roles: [master]
#
# ----------------------------------- Paths ------------------------------------
#
# Path to directory where to store the data (separate multiple locations by comma):
#
path.data: /var/lib/elasticsearch
#
# Path to log files:
#
path.logs: /var/log/elasticsearch
#
# ----------------------------------- Memory -----------------------------------
#
# Lock the memory on startup:
#
bootstrap.memory_lock: true
#
# ---------------------------------- Network -----------------------------------
#
# By default Elasticsearch is only accessible on localhost. Set a different
# address here to expose this node on the network:
#
network.host: 0.0.0.0
#
# --------------------------------- Discovery ----------------------------------
#
# Pass an initial list of hosts to perform discovery when this node is started:
#
discovery.seed_hosts: ["172.21.128.47", "172.21.128.49", "172.21.128.57", "172.21.128.63", "172.21.128.85"]
#
# Bootstrap the cluster using an initial set of master-eligible nodes:
#
cluster.initial_master_nodes: ["es-master"]
#
#----------------------- BEGIN SECURITY AUTO CONFIGURATION -----------------------
#
# The following settings, TLS certificates, and keys have been automatically
# generated to configure Elasticsearch security features on 01-09-2022 02:03:44
#
# --------------------------------------------------------------------------------

# Enable security features
xpack.security.enabled: false

xpack.security.enrollment.enabled: false

# Enable encryption for HTTP API client connections, such as Kibana, Logstash, and Agents
xpack.security.http.ssl:
  enabled: false
  keystore.path: certs/http.p12

# Enable encryption and mutual authentication between cluster nodes
xpack.security.transport.ssl:
  enabled: false
  verification_mode: certificate
  keystore.path: certs/transport.p12
  truststore.path: certs/transport.p12

xpack.monitoring.collection.enabled: true
xpack.monitoring.exporters.my_local:
  type: local
  use_ingest: false
...





// 패키지 설치
$ sudo apt-get update && sudo apt-get install kibana

// 시스템 재시작 시 자동 실행되도록 설정
$ sudo systemctl daemon-reload
$ sudo systemctl enable kibana.service