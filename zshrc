export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# ============= ALIASES ===========================

# servers
alias data="ssh tsahasra@data.cs.purdue.edu"


# configs
alias nvc="nvim ~/.config/nvim/init.lua"
alias zshc="nvim ~/.zshrc"
alias rel="source ~/.zshrc"
alias trel="tmux source-file ~/.config/tmux/tmux.conf"

# shell commands
alias ..="cd .."
alias ll="ls -la"
alias c="clear"


alias cc="claude --dangerously-skip-permissions"
