# How to install 
## Set up
- Master Node (Control plane)
  - ip: masterIP
- Worker Node 
  - ip: salveIP-1
  - ip: salveIP-2
    ... 
## Step
### Common
설치 전 확인
- Ubuntu (버전확인)
```
    uname -a
```
- 메모리 2GM 정도는 남아있어야한다
- 컨트롤 플레인은 최소 2CPU는 있어야한다
-
- 각 노드들 간 통신 확인(클러스터), port 연결 확인
```shell
nc {ip} 6443
```

- kubeadm 설치: 쿠버네티스 클러스터 부트스트랩
[공식설치방법](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm)
- kubelet 설치: 쿠버네티스 컴포넌트 관련 처리
- kubectl 설치: 쿠버네티스 클러스터에 명령어 전달

```shell
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
```

```shell
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
```

```shell
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
```
```shell
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
```shell
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

### Master Node 
```
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address={masterIp(private)}
```
```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
 ```
(오류 시)다시 설정 시 
```
kubeadm reset
```
### Worker Node 
[클러스터링](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
Master Node 설정 이후 나온곳 처리

You can now join any number of machines by running the following on each node
as root:
```shell 
    kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
```
- token 분실시  
```
kubeadm token list 
kubeadm token generate
```
- hash
```
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
openssl dgst -sha256 -hex | sed 's/^.* //'
```
