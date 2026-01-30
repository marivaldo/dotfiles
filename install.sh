#!/usr/bin/env bash
#
# Dotfiles installation - creates symlinks
#

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# source:target
MAPPINGS=(
  "fish:$HOME/.config/fish"
  "nvim:$HOME/.config/nvim"
  "kitty:$HOME/.config/kitty"
  "git/gitconfig:$HOME/.gitconfig"
  "vim/vimrc:$HOME/.vimrc"
  "ssh/config:$HOME/.ssh/config"
  "starship.toml:$HOME/.config/starship.toml"
)

for mapping in "${MAPPINGS[@]}"; do
  source="$DOTFILES_DIR/${mapping%%:*}"
  target="${mapping##*:}"

  if [[ -L "$target" ]]; then
    echo "skip: $target (já é symlink)"
  elif [[ -e "$target" ]]; then
    echo "WARN: $target existe (remova manualmente)"
  else
    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "ok: $target -> $source"
  fi
done
