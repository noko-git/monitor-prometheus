#!/bin/bash

# usage
SCRIPT_FILE=`basename $0`
function usage()
{
  echo "usage: ${SCRIPT_FILE}" 1>&2
}

# main
docker run --name monitor_prometheus \
  -p 19090:9090 \
  -p 19093:9093 \
  -p 13000:3000 \
  -it monitor_prometheus
