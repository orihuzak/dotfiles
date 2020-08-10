#!/bin/bash

## install packages to build environment

sudo apt-get update

# install Homebrew
if type brew >/dev/null 2>&1; then
  brew bundle
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew bundle
fi

## for nvim
pip3 install pynvim
# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## for ruby
gem install bundler

# install deno
curl -fsSL https://deno.land/x/install/install.sh | sh


