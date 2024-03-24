#!/bin/bash

# Install docker
./wsl/install-docker.sh

# Install kubectl
chmod +x ./wsl/install-kubectl.sh
./wsl/install-kubectl.sh