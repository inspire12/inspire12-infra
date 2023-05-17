```
sudo wget -qO- http://get.docker.com/ | sh

sudo apt-get update
sudo apt-get install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
```
```
sudo apt-get install \
                         apt-transport-https \
                     ca-certificates \
                     curl \
                     gnupg-agent \
                     software-properties-common
```
```
#Install
sudo yum install docker

sudo usermod -aG docker $USER
 
#Docker 서비스 실행
sudo service docker start
 
#부팅시 자동 실행 설정
sudo chkconfig docker on