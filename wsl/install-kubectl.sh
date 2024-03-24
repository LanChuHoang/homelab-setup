#!/bin/bash

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

log_error() {
    echo -e "${RED}[$(date +"%Y-%m-%d %H:%M:%S")] $1${NC}"
}

log_warn() {
    echo -e "${YELLOW}[$(date +"%Y-%m-%d %H:%M:%S")] $1${NC}"
}

log_info() {
    echo -e "${GREEN}[$(date +"%Y-%m-%d %H:%M:%S")] $1${NC}"
}

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