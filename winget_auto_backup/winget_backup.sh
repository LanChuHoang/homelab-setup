#!/bin/bash
HOMELAB_DIR=/home/lanchu/homelab-setup

winget.exe export -o "$HOMELAB_DIR/winget-packages.json"
cd "$HOMELAB_DIR" || return
git pull --no-edit
git add .
git commit -m 'backup winget'
git push origin main
