#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce=17.06.0~ce-0~ubuntu

sudo docker --version
sudo usermod -aG docker $USER
sudo service docker start

docker pull softsrv/minecraft:1.11.2
docker pull softsrv/minecraft:1.12

docker info
docker images
