#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

# Install node
log_info "Installing Node"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

log_info "Node installed. Please restart your shell and run ' nvm install --lts' to install the latest version of Node."
