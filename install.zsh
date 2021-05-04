DOTFILES_REPO=$HOME/.dotfiles

link_file () {
	if [[ -f $2 ]] {
		read -q "ans?Would you like to overwrite $1? "
		echo ""
		if [[ $ans == "y" ]] {
			ln -fsv $1 $2
		}
	} else {
		ln -sv $1 $2
	}
}

echo "Loading files from: $DOTFILES_REPO"
echo "Symlinking config files..."
 
link_file $DOTFILES_REPO/vim/.vimrc $HOME/.vimrc
link_file $DOTFILES_REPO/zsh/.zshrc $HOME/.zshrc
