#!/bin/sh

set -e

read -p "This will blow away existing neovim configs, continue? (y/n)" yn

if [[ ! $yn =~ ^[Yy].* ]]; then
    echo "Back up your configs and try again:"
    echo "mv ~/.config/nvim ~/.config/nvim.bak"
    echo "mv ~/.local/share/nvim ~/.local/share/nvim.bak"
    exit
fi

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone git@github.com:itsyohan/AstroNvimConfig.git ~/.config/nvim/lua/user
