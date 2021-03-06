#!/bin/bash

sudo yum update
sudo yum install -y docker

sudo usermod -aG docker $USER
sudo service docker start

sudo docker pull softsrv/minecraft:1.11.2
sudo docker pull softsrv/minecraft:1.12
sudo docker pull softsrv/minecraft:1.12.2

sudo docker info
sudo docker images
