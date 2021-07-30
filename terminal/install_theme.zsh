#!/bin/zsh

echo "Grabbing the latest dracula theme..."
if curl -G https://raw.githubusercontent.com/dracula/alacritty/master/dracula.yml --output "$HOME/.config/dracula_theme.yml" --silent ; then
  echo "Theme downloaded!"
else
  echo "Failed downloading theme."
fi
