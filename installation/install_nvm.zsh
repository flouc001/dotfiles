#!/bin/zsh

echo "Grabbing and installing the latest nvm..."
if curl -s https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash; then
  echo "Installed nvm!"
else
  echo "Failed installing nvm."
fi
 
