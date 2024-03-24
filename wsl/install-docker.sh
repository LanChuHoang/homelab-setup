#!/bin/bash

# Install docker

# Uninstall conflict packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Setup apt repository
echo "setup apt repository"
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker
echo "install docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify that Docker Engine is installed correctly by running the hello-world image.
echo "verify docker"
sudo docker run hello-world

# Configure Docker to start on boot
echo "configure docker to start on boot"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Post-installation steps for Linux
echo "post-installation steps for Linux"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
echo "Docker installed successfully"

# Enable json log rotation
echo "enable json log rotation"
sudo touch /etc/docker/daemon.json
echo '{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "1000m"
  }
}' | sudo tee /etc/docker/daemon.json