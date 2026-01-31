#!/usr/bin/env bash
#
# Dotfiles installation - creates symlinks and installs plugins
#

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Creating symlinks ==="

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

echo ""
echo "=== Installing Homebrew packages ==="

if command -v brew &> /dev/null; then
  brew bundle install --file="$DOTFILES_DIR/Brewfile"
else
  echo "Homebrew not installed. Install from https://brew.sh/ first."
  exit 1
fi

echo ""
echo "=== Installing Fisher plugins ==="

# Install Fisher if not present
if [[ ! -f "$HOME/.config/fish/functions/fisher.fish" ]]; then
  echo "Installing Fisher..."
  fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fi

# Install plugins from fish_plugins
echo "Installing plugins from fish_plugins..."
fish -c "fisher update"

echo ""
echo "Done! Open a new terminal to apply changes."
