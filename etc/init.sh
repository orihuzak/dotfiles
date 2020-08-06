#!/bin/bash

# install packages to build environment

sudo apt-get update

# install Homebrew
if type brew >/dev/null 2>&1; then
  brew bundle
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew bundle
fi

# for nvim
pip3 install pynvim

# install deno
curl -fsSL https://deno.land/x/install/install.sh | sh


