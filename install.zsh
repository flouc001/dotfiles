DOTFILES_REPO=$HOME/.dotfiles

link_file () {
	src=$1
	dst=$2
	if [[ -f $dst || -h $dst ]] {
		read -q "ans?Would you like to overwrite $dst? "
		echo ""
		if [[ $ans == "y" ]] {
			ln -fhsv $src $dst
		}
	} else {
		ln -sv $src $dst
	}
}

echo "Loading files from: $DOTFILES_REPO"

install_dotfiles () {
	echo "Symlinking config files..."
	for src in $(find -H "$DOTFILES_REPO" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
	do
		dst="$HOME/.$(basename "${src%.*}")"
		link_file "$src" "$dst"
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

install_git
install_dotfiles
