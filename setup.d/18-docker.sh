#!/bin/bash

# docker repository
sudo apt-get install \
    ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y \
    docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo usermod -aG docker $USER
sudo service docker restart

docker run hello-world

# manually install docker-compose
#DOCKER_CONFIG=/usr/local/lib/docker
#sudo mkdir -p $DOCKER_CONFIG/cli-plugins
#sudo curl -SL "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-linux-x86_64" \
#    -o $DOCKER_CONFIG/cli-plugins/docker-compose
#sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
