#!/bin/bash

echo "🔗 Linking config files..."

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

echo "🔗 Linking .zshrc..."
ln -sf "$HOME/dotfiles/home/.zshrc" "$HOME/.zshrc"

echo "🔗 Linking .desktop entry..."
mkdir -p "$HOME/.local/share/applications"
ln -sf "$HOME/dotfiles/.local/share/applications/nvim.desktop" "$HOME/.local/share/applications/nvim.desktop"

echo "🔗 Linking custom scripts..."

SCRIPTS=(
  nvim-launch
  kbbacklight
  sleep
)

mkdir -p "$HOME/.local/bin"

for script in "${SCRIPTS[@]}"; do
  src="$HOME/dotfiles/config/scripts/$script.sh"
  dest="$HOME/.local/bin/$script"
  ln -sf "$src" "$dest"
  chmod +x "$dest"
  echo "✅ Linked $script"
done

echo -e "\n🎉 All configs and scripts linked!"

