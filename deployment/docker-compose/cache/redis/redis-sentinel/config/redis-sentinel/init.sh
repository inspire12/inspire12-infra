#!/bin/zsh
IP=$(ifconfig | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1' | sed '1 d' | head -n1)
echo $IP
sed -i "" "s@{{ IP }}@$IP@g" ./redis.conf