#!/bin/sh

#Add stable docker-ce repo to install containerd runtime
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Below command to install latest docker version
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#Install the  cri-dockerd to support on docker
cd ~
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.12/cri-dockerd-0.3.12-3.el7.x86_64.rpm
yum install cri-dockerd-0.3.12-3.el7.x86_64.rpm -y

# Enable CRI plugin since as bydefault docker disable this

sed -i 's/disabled/enabled_plugin/g' /etc/containerd/config.toml

systemctl restart containerd
systemctl restart docker

echo '1' | sudo tee /proc/sys/net/ipv4/ip_forward

echo 'net.bridge.bridge-nf-call-iptables=1' | sudo tee -a /etc/sysctl.conf

sysctl -p

