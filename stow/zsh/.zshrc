CONFIG_DIRECTORY="${HOME}/.config"
DOTFILES_REPO="${HOME}/.dotfiles"

# Load Brew
if [[ -s "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ZSH_THEME="robbyrussell"
if [[ -f "${CONFIG_DIRECTORY}/zsh/p10k.zsh" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  source "${CONFIG_DIRECTORY}/zsh/p10k.zsh"
fi

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
alias gbd='g branch -D '
alias gnuke='g reset --hard && g clean -fd'
alias gir='g rebase -i '

alias t='nvim $HOME/Documents/todo.md'

# Node aliases
alias npmr='npm run '

# Extra Config
if [[ -f $CONFIG_DIRECTORY/zsh/.extra.zsh ]] {
 source $CONFIG_DIRECTORY/zsh/.extra.zsh
}

# Load PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Load RBEnv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Add the Z command installed with brew
. $(brew --prefix)/etc/profile.d/z.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ -d $HOME/.rd/bin ]] {
  export PATH="$HOME/.rd/bin:$PATH"
}

if [[ -d $HOME/.session-manager/bin ]] {
  export PATH="$HOME/.session-manager/bin:$PATH"
}

if [[ -f /opt/homebrew/opt/asdf/asdf.sh ]] {
  . /opt/homebrew/opt/asdf/libexec/asdf.sh

  export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY="latest_installed"
}

