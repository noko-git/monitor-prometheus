FROM ubuntu:18.04

# add apt repository for grafana
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    gnupg2 \
    curl \
    software-properties-common
#    libcurl3-gnutls \
#    curl \
#    gnupg2 \
#    ca-certificates

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
