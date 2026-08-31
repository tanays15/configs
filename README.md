# configs

Personal dotfiles for zsh, tmux, Neovim, yabai, skhd, and Ghostty.

This repo holds the real config files. The standard locations
(`~/.zshrc`, `~/.config/tmux/tmux.conf`, `~/.config/nvim`,
`~/.config/yabai/yabairc`,
`~/.config/skhd/skhdrc`)
are symlinks pointing back in here, so editing either path edits the same
file, and GitHub shows actual content rather than link pointers.

Ghostty's macOS app reads its config from
`~/Library/Application Support/com.mitchellh.ghostty/config`, which takes
precedence over the XDG path (`~/.config/ghostty/config`) even when both
exist. Both are symlinked to `ghostty.conf` here — the Application Support
one is what actually takes effect; the XDG one is kept in sync for
completeness (e.g. running `ghostty` from the CLI with `$XDG_CONFIG_HOME`
set).

## Install the tools

```sh
brew install tmux neovim ghostty fzf koekeishiya/formulae/yabai koekeishiya/formulae/skhd
```

zsh ships with macOS by default. To make it your login shell if it isn't
already:

```sh
chsh -s $(which zsh)
```

## Fresh machine setup

1. Clone this repo:


2. Run the install script. It symlinks `~/.zshrc`, `~/.config/tmux/tmux.conf`,
   `~/.config/nvim`, the yabai and skhd configs, and the Ghostty config back to the
   files in this repo (backing up anything already at those paths as `<path>.bak`),
   then installs TPM and fetches the tmux plugins declared in `tmux.conf`:

   ```sh
   ./install.sh
   ```

3. Reload:

   ```sh
   source ~/.zshrc
   tmux source-file ~/.config/tmux/tmux.conf
   nvim   # installs plugins via vim.pack on first launch
   ```
