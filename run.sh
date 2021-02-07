#!/bin/bash

# usage
SCRIPT_FILE=`basename $0`
function usage()
{
  echo "usage: ${SCRIPT_FILE}" 1>&2
}

# main
docker run --name monitor_prometheus \
  -p 9090:19090 \
  -p 3000:13000 \
  -p 9093:19093 \
  -it monitor_prometheus
