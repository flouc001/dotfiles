# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
DOTFILES_REPO=$HOME/.dotfiles

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -d $DOTFILES_REPO ]] {
  source $DOTFILES_REPO/zsh/.main
}

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
