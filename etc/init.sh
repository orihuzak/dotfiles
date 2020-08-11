#!/bin/bash

## install packages to build environment

echo -e "\nReload .bash_profile"
. $HOME/.bash_profile

echo -e "\nsudo apt-get update"
sudo apt-get update

# install Homebrew
if ! type brew >/dev/null 2>&1; then
  echo -e "\nInstall Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo -e "\nInstall Homebrew formulae"
brew bundle

## for nvim
echo -e "\nInstall pynvim"
pip3 install pynvim

echo -e "\nInstall vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo -e "\nInstall n/vim plugins"
nvim +PlugInstall +qall

## for ruby
echo -e "\nInstall bundler, a ruby gem"
gem install bundler

# install deno
echo -e "\nInstall deno"
curl -fsSL https://deno.land/x/install/install.sh | sh


