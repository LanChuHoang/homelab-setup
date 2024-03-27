#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

# Install java
log_info "Installing sdkman for SDK management"
sudo apt install -y curl zip unzip
curl -s "https://get.sdkman.io" | bash

log_info "Installed sdkman for SDK management. For installing java, run 'sdk install java' in a new shell."
