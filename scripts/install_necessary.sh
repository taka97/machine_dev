#!/bin/bash

# Temp fix
sudo mkdir -m 600 /root/.gnupg

# Install docker
sudo groupadd docker
sudo usermod -aG docker $USER

# Add repository into apt repo
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/rmescandon-ubuntu-yq.gpg --keyserver keyserver.ubuntu.com --recv-keys CC86BB64
echo "deb [signed-by=/usr/share/keyrings/rmescandon-ubuntu-yq.gpg] https://ppa.launchpadcontent.net/rmescandon/yq/ubuntu/ jammy main" \
| sudo tee -a /etc/apt/sources.list.d/rmescandon-ubuntu-yq-jammy.list > /dev/null

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

sudo apt-get update

# Install neccessary package
## jq (parse json in command line)
## yq (parse yaml in command line)
sudo apt-get --assume-yes install jq yq helm

# Kubernetes client
cd /usr/local/bin && sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && sudo chmod +x kubectl
