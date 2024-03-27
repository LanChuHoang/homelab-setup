#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

# Install zsh
log_info "Installing zsh"
apt install zsh -y
log_info "Zsh installed successfully"

# Verify zsh installation
log_info "Verifying zsh installation"
zsh --version

# Set zsh as the default shell
log_info "Setting zsh as the default shell"
chsh -s "$(which zsh)"
log_info "Zsh setup successfully. Please restart your terminal to see the changes."
