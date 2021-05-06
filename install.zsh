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
echo "Symlinking config files..."

install_dotfiles () {
	for src in $(find -H "$DOTFILES_REPO" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
	do
		dst="$HOME/.$(basename "${src%.*}")"
		link_file "$src" "$dst"
	done
}

install_dotfiles
