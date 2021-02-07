FROM ubuntu:18.04

# add apt repository for grafana
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    gnupg2 \
    curl \
    software-properties-common

RUN curl -k https://packages.grafana.com/gpg.key | apt-key add - \
  && add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

# apt install
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    prometheus \
    prometheus-node-exporter \
    prometheus-alertmanager \
    grafana \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

# make dir for prometheus
RUN mkdir /var/run/prometheus \
  && chown -R prometheus /var/run/prometheus

# copy config and init service script
COPY init.sh /root/
COPY prometheus.yml /etc/prometheus/
COPY rules.yml /etc/prometheus/
COPY alertmanager.yml /etc/prometheus/

# expose ports
# prometheus
EXPOSE 9090
# alert manager
EXPOSE 9093
# grafana
EXPOSE 3000

CMD bash /root/init.sh