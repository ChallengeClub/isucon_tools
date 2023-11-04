#!/bin/sh
sudo apt -y install prometheus prometheus-node-exporter

# jq install
sudo apt install -y jq

# alp install
wget https://github.com/tkuchiki/alp/releases/download/v1.0.18/alp_linux_amd64.tar.gz
tar xvzf alp_linux_amd64.tar.gz
sudo mv alp /usr/local/bin/alp
which alp

# Apache Bench
# ab install
sudo apt install -y apache2-utils
