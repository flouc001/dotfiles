#!/bin/zsh

echo "NVIM: Downloading latest vim-plug..."
if sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' ; then
  echo "NVIM: vim-plug downloaded and installed in autoload directory!"
else
  echo "NVIM: Problem downloading vim-plug"
fi
