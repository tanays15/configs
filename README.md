# configs

Personal dotfiles for zsh, tmux, and Neovim.

This repo holds the real config files. The standard locations
(`~/.zshrc`, `~/.config/tmux/tmux.conf`, `~/.config/nvim`) are symlinks
pointing back in here, so editing either path edits the same file, and
GitHub shows actual content rather than link pointers.

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


2. Run the install script. It symlinks `~/.zshrc`, `~/.config/tmux/tmux.conf`,
   and `~/.config/nvim` back to the files in this repo (backing up anything
   already at those paths as `<path>.bak`), then installs TPM and fetches the
   tmux plugins declared in `tmux.conf`:

   ```sh
   ./install.sh
   ```

3. Reload:

   ```sh
   source ~/.zshrc
   tmux source-file ~/.config/tmux/tmux.conf
   nvim   # installs plugins via vim.pack on first launch
   ```
