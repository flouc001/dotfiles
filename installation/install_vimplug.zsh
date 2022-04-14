#!/bin/zsh

echo "Installing vim-plug for vim and nvim..."

vim_autoload_directory="${HOME}/.vim/autoload"
nvim_autoload_directory="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/"

if [[ ! -f "${vim_autoload_directory}/plug.vim" ]] then
  echo "Creating directories: ${vim_autoload_directory}, ${nvim_autoload_directory}"
  mkdir -p $vim_autoload_directory
  mkdir -p $nvim_autoload_directory

  echo "Fetching and writing plugin file..."
  curl -sfL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | tee "${vim_autoload_directory}/plug.vim" "${nvim_autoload_directory}/plug.vim" > /dev/null
  if [ $? -eq 0 ] ; then
    echo "Successfully installed vim-plug!"
  else
    echo "Problems installing vim-plug."
  fi
else
  echo "Found existing vimplug installation."
fi
