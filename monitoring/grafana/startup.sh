sudo mkdir -p /root/grafana
sudo mkdir -p /root/grafana/config
sudo chown 472.472 /root/grafana/config

docker-compose build
docker-compose down
docker-compose up -d
docker-compose ps
docker-compose logs