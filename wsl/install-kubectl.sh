#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

# Download kubectl
log_info "Downloading kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Verify the downloaded binary
log_info "Verifying the downloaded binary"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
log_info "Installing kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Verify the installation
log_info "Verifying the installation"
kubectl version --client

# Cleanup
log_info "Cleaning up"
rm kubectl kubectl.sha256

log_info "kubectl installed successfully"
