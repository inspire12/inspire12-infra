#!/bin/zsh
cd ..

docker-compose -f $PWD/docker-compose/cache/redis/redis-sentinel/docker-compose.yml up
