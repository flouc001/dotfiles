#!/bin/zsh

echo "VIM: Downloading latest vim-plug..."
if curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ; then
  echo "VIM: vim-plug downloaded and installed in autoload directory!"
else
  echo "VIM: Problem downloading vim-plug, plugins have not been installed."
fi
