CONFIG_DIRECTORY="${HOME}/.config"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ZSH_THEME="robbyrussell"
if [[ -f "${CONFIG_DIRECTORY}/zsh/p10k.zsh" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  source "${CONFIG_DIRECTORY}/zsh/p10k.zsh"
fi

# Enable PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Functions
alias notes="ls -1t ~/Documents/notes"

note () {
  name=$1
  vim $HOME/Documents/notes/$name
}

# Git aliases
alias g='git'
alias ga='git add'
alias gd='g diff'
alias gdh='g diff HEAD'
alias gco='g checkout'
alias gcob='g checkout -b '
alias gss='g status -sb -uall'
alias gll='g log --oneline'
alias glast='g log -1 HEAD --stat'
alias gc='g commit'
alias gl='g pull'
alias gaa='g add --all'
alias gp='g push'
alias gpo='g push --set-upstream origin '
alias gst='g stash'
alias gstd='g stash drop'
alias gstl='g stash list'
alias gstm='g stash -m '
alias gstp='g stash pop'

# Extra Config
if [[ -f $DOTFILES_REPO/zsh/.extra ]] {
 source $DOTFILES_REPO/zsh/.extra
}
