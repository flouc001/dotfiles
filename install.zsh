export DOTFILES_REPO=$HOME/.dotfiles

echo "Loading files from: $DOTFILES_REPO"

stow_config () {
  for package in $(find "$DOTFILES_REPO/stow" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)
  do
    # Intentionally only additive, to remove a package run:
    # stow -d "$DOTFILES_REPO/stow" -t "$HOME" --dotfiles -D {package_name}
    echo "Stowing: $package"
    stow -d "$DOTFILES_REPO/stow" -t "$HOME" --dotfiles -R $package
  done
}

install_git () {
  echo "Installing git config..."
  if [[ ! -f "$HOME/.gitconfig" ]] {
    creds_file="$DOTFILES_REPO/git/.creds"
    if [[ -f $creds_file ]] {
      source $creds_file

      git config --global user.name "$GH_AUTHOR_NAME"
      git config --global user.email "$GH_EMAIL"
      git config --global github.user "$GH_USER"
      git config --global include.path "$DOTFILES_REPO/git/gitconfig.ini"
    }
  }
}

run_installs () {
  echo "Running other install files..."
  for src in $(find "$DOTFILES_REPO/installation" -name "install_*")
  do
    echo "Executing: $src"
    zsh $src
  done
}

stow_config
install_git
run_installs

