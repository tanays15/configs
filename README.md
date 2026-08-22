# configs

Personal dotfiles for zsh, tmux, and Neovim.

Each entry in this repo is a **symlink pointing back to the real file's
location** (e.g. `tmux.conf -> ~/.config/tmux/tmux.conf`), not a copy of the
content. That means:

- On the machine these were created on, the repo is just a convenient,
  version-controlled window into files that already live in place — editing
  either path edits the same file.
- On a **new** machine, cloning this repo only gets you the symlinks
  themselves; there's nothing at the far end of them yet. See "Fresh
  machine setup" below to actually put the content in place.

## Install the tools

```sh
brew install tmux neovim
```

zsh ships with macOS by default. To make it your login shell if it isn't
already:

```sh
chsh -s $(which zsh)
```

## Fresh machine setup

1. Clone this repo:

   ```sh
   git clone <your-repo-url> ~/Documents/Development/configs
   ```

2. Copy the *content* into the real locations (using `-L` to follow the
   symlinks and copy the actual files, since the repo only holds pointers):

   ```sh
   cd ~/Documents/Development/configs
   cp -L zshrc ~/.zshrc
   mkdir -p ~/.config/tmux
   cp -L tmux.conf ~/.config/tmux/tmux.conf
   cp -RL nvim ~/.config/nvim
   ```

3. Install TPM (tmux plugin manager) and fetch the plugins declared in
   `tmux.conf`:

   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   tmux new-session -d -s _tpm_bootstrap
   tmux send-keys -t _tpm_bootstrap '~/.tmux/plugins/tpm/scripts/install_plugins.sh' Enter
   ```

   (or start tmux and press `prefix + I` once attached).

4. Reload:

   ```sh
   source ~/.zshrc
   tmux source-file ~/.config/tmux/tmux.conf
   nvim   # installs plugins via vim.pack on first launch
   ```
