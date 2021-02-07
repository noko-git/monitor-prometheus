#!/bin/bash

/usr/sbin/service prometheus restart
/usr/sbin/service prometheus-alertmanager restart
/usr/sbin/service grafana-server restart

while true ; do
    /bin/bash    # 最後のプロセスはフォアグラウンドで起動
done