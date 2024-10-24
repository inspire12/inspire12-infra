#!/bin/bash

export timestamp=$(date +%Y%m%d_%H%M%S) && \
export volume_path=$(pwd)/jmeter-scripts && \
export plugins_path=$(pwd)/jmeter-plugins && \
export jmeter_path=/mnt/jmeter && \
docker run \
  --volume "${volume_path}":${jmeter_path} \
  --volume "${volume_path}":${jmeter_path} \
  justb4/jmeter \
   bash -c "java -cp /opt/apache-jmeter-5.4.1/lib/ext/jmeter-plugins-manager-1.3.jar org.jmeterplugins.repository.PluginManagerCMD install jpgc-casutg com.blazemeter.jmeter.RandomCSVDataSetConfig" \
  -n \
  -t ${jmeter_path}/example-inspire12.jmx \
  -JINFLUXDB_HOST="host.docker.internal" \
  -l ${jmeter_path}/results/result_${timestamp}.jtl \
  -j ${jmeter_path}/results/jmeter_${timestamp}.log
