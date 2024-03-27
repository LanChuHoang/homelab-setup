#!/bin/bash

# shellcheck disable=SC1091
source ./wsl/utils.sh

# Install nerd-fonts
log_info "Installing Nerd Fonts"
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts || exit
chmod +x ./install.sh
./install.sh
cd ..
rm -rf nerd-fonts

log_info "Nerd Fonts installed"
