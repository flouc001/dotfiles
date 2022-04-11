#!/bin/zsh

echo "Grabbing the latest dracula theme..."
if curl -G https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors --output "$HOME/.config/Dracula.itermcolors" --silent ; then
  echo "Theme downloaded!"
else
  echo "Failed downloading theme."
fi
