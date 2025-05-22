#!/bin/bash

# Source your profile to load env vars and paths
[ -f "$HOME/.profile" ] && source "$HOME/.profile"
[ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc"

# Set kitty padding
kitty @ set-spacing padding=0

# Launch Neovim
nvim "$@"

# Reset padding
kitty @ set-spacing padding=20


