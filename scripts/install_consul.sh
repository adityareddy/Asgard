#!/usr/bin/env bash
set -eux
set -o pipefail

CONSUL_VERSION=0.5.2

cd /tmp/
wget https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_linux_amd64.zip -O consul.zip
echo Installing Consul...
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul
sudo mkdir /etc/consul.d
sudo mkdir /etc/service
sudo chmod -R 777 /etc/consul.d
echo manual | sudo tee /etc/init/consul.override >/dev/null
echo manual | sudo tee /etc/init/consul-join.override >/dev/null

wget https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_web_ui.zip  -O consul-web_ui.zip
echo Installing Consul Web UI...
unzip consul-web_ui.zip
sudo mv dist /opt/consul-ui