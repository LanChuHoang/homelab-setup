#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

# Install oh-my-zsh
log_info "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
log_info "oh-my-zsh installed successfully"
