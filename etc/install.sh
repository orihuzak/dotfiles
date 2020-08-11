#!/bin/bash

# install.sh for Debian and Ubuntu

is_exists() {
  which "$1" >/dev/null 2>&1
  return $?
}

## Dotfiles

# set DOTPATH as default variable
if [ -z "${DOTPATH:-}" ]; then
  DOTPATH=~/dotfiles; export DOTPATH
fi

DOTFILES_GITHUB="https://github.com/orihuzak/dotfiles.git" ; export DOTFILES_GITHUB

dotfiles_download() {
  if [ -d "$DOTPATH" ]; then
    echo "$DOTPATH: already exists"
    exit 1
  fi

  if is_exists "git"; then
    git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"
  else
    echo "we don't have git."
    exit 1
  fi
}

dotfiles_deploy() {
  echo "Deploying dotfiles"

  if [ ! -d $DOTPATH ]; then
    echo "$DOTPATH: not found."
    exit 1
  fi

  cd "$DOTPATH"
  make deploy
  . $HOME/.bash_profile
}

dotfiles_initialize() {
  if [ -f Makefile ]; then
    make init
  else
    echo "Makefile: not found."
    exit 1
  fi
}

dotfiles_install() {
  dotfiles_download &&
  dotfiles_deploy &&
  dotfiles_initialize
}

dotfiles_install

