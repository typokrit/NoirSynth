#!/bin/bash

echo "Linking config files..."

CONFIGS=(
  hypr
  waybar
  wlogout
  fastfetch
  kitty
  wofi
  rofi
  fontconfig
  gtk-3.0
  scripts
  themes
  user-dirs.locale
  user-dirs.dirs
)

for config in "${CONFIGS[@]}"; do
  echo "Linking $config..."
  ln -sf "$HOME/dotfiles/config/$config" "$HOME/.config/$config"
done

echo "Linking .zshrc..."
ln -sf "$HOME/dotfiles/home/.zshrc" "$HOME/.zshrc"

echo "Done!"
