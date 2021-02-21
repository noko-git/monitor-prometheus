# monitor-prometheus

## Start container(prometheus, alertmanager, grafana)

```bash
$ docker build ./ -t monitor_prometheus
$ bash run.sh
```

## Exporter example
## node exporter

```bash
$ apt update
$ apt install prometheus-node-exporter
```


## Query example
* CPU使用率（%）
  * `100-(max by (instance)(irate(node_cpu{mode="idle"}[5m])) * 100)`
* メモリ使用率(%)
  * `100 * (1 - ((max_over_time(node_memory_MemFree[5m]) + max_over_time(node_memory_Cached[5m]) + max_over_time(node_memory_Buffers[5m])) / max_over_time(node_memory_MemTotal[5m])))`
* スワップ使用量
* OOMKillerの発生
* インターフェイスに対するイン・アウトのオクテット数、エラー数、ドロップ数
* ディスク使用率
  * `100 * (1-node_filesystem_avail{mountpoint="/"}/node_filesystem_size{mountpoint="/"})`
* IOPS
* マウントカウント
* プロセスカウント
  * sshd
  * crond
  * vsftpd
  * ミドル
* SSL証明書
* 秒間リクエスト数
* リクエスト時間
* DBコネクション数
* キューの長さ
* 秒間メッセージ数
* キャッシュから追い出されたアイテム数（evicted items）
* ヒット・ミス率（hit/miss ratio）
* NTP
* ログ
  * /var/log/messages
  * HTTPレスポンス
  * sudoの使用
  * SSHログイン
  * cronジョブの結果
  * スロークエリ
  * auditd

## Appendix
* 