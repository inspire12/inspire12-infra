#!/bin/bash

export timestamp=$(date +%Y%m%d_%H%M%S) && \
export volume_path=$(pwd)/jmeter-scripts && \
export jmeter_path=/mnt/jmeter && \
docker run \
  --volume "${volume_path}":${jmeter_path} \
  justb4/jmeter \
  -n \
  -t ${jmeter_path}/$1 \
  -JINFLUXDB_HOST="host.docker.internal" \
  -l ${jmeter_path}/results/result_${timestamp}.jtl \
  -j ${jmeter_path}/results/jmeter_${timestamp}.log
