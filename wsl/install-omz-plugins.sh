#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Install oh-my-zsh plugins
log_info "Installing oh-my-zsh plugins"

# fzf
log_info "Installing fzf"
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install

# zsh-autosuggestions
log_info "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# zsh-syntax-highlighting
log_info "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

log_info "oh-my-zsh plugins installed successfully"
