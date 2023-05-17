sudo mkdir -p ./grafana
sudo mkdir -p ./grafana/config
sudo mkdir -p ./grafana/plugins
sudo chown 472.472 ./grafana/config

docker-compose build
docker-compose down
docker-compose up -d
docker-compose ps
docker-compose logs