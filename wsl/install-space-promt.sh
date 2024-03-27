#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

# Install space-prompt
log_info "Installing Space Prompt"

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
echo "$ZSH_CUSTOM"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth 1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

log_info "Space Prompt installed. Please set ZSH_THEME=\"spaceship\" in your .zshrc file."
