#!/bin/zsh

echo "Grabbing and installing the latest nvm..."

if [[ ! -d "$HOME/.nvm" ]] then
  if curl -s https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash; then
    echo "Installed nvm!"
  else
    echo "Failed installing nvm."
  fi
else
  echo "Found existing installation."
fi
