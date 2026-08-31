#!/usr/bin/env bash
# Installs these dotfiles onto a fresh machine by symlinking the real
# locations (~/.zshrc, ~/.config/tmux/tmux.conf, ~/.config/nvim, yabai,
# karabiner) back to
# the files tracked in this repo. Anything already at those paths is
# backed up with a .bak suffix rather than overwritten silently.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_file() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Backing up existing $dest -> $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "Linked $dest -> $src"
}

link_file "$repo_dir/zshrc" "$HOME/.zshrc"
link_file "$repo_dir/tmux.conf" "$HOME/.config/tmux/tmux.conf"
link_file "$repo_dir/nvim" "$HOME/.config/nvim"
link_file "$repo_dir/yabairc" "$HOME/.config/yabai/yabairc"
link_file "$repo_dir/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# Ghostty's macOS app reads from Application Support, taking precedence over
# the XDG path even when both exist; link both so the XDG path is still
# correct (e.g. for the ghostty CLI with $XDG_CONFIG_HOME set) without
# affecting which one the app actually uses.
link_file "$repo_dir/ghostty.conf" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
link_file "$repo_dir/ghostty.conf" "$HOME/.config/ghostty/config"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM (tmux plugin manager)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Fetching tmux plugins..."
"$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh"

echo "Done. Run: source ~/.zshrc && tmux source-file ~/.config/tmux/tmux.conf"
