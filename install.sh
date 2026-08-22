#!/usr/bin/env bash
# Installs these dotfiles onto a fresh machine by copying the real content
# (following the symlinks) into place. Existing files at the destination
# are backed up with a .bak suffix rather than overwritten silently.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_file() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Backing up existing $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  mkdir -p "$(dirname "$dest")"
  cp -RL "$src" "$dest"
  echo "Installed $dest"
}

install_file "$repo_dir/zshrc" "$HOME/.zshrc"
install_file "$repo_dir/tmux.conf" "$HOME/.config/tmux/tmux.conf"
install_file "$repo_dir/nvim" "$HOME/.config/nvim"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM (tmux plugin manager)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Fetching tmux plugins..."
"$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh"

echo "Done. Run: source ~/.zshrc && tmux source-file ~/.config/tmux/tmux.conf"
