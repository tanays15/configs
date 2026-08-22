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


2. Run the install script. It copies the real content into place (following
   the symlinks, since the repo only holds pointers), backing up anything
   already at those paths as `<path>.bak`, then installs TPM and fetches the
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
