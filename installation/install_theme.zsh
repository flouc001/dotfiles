#!/bin/zsh

echo "Alacritty: Grabbing the latest dracula theme..."
if curl -G https://raw.githubusercontent.com/dracula/alacritty/master/dracula.yml --output "$HOME/.config/dracula_theme.yml" --silent ; then
  echo "Alacritty: Theme downloaded!"
else
  echo "Alacritty: Failed downloading theme."
fi
