#!/bin/sh

# Make sure the target directory exists
mkdir -p "$HOME/.config/ghostty"

# Create the nested symlink
ln -sf "$HOME/.dotfiles/ghostty/config.ghostty" "$HOME/.config/ghostty/config.ghostty"