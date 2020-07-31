#!/bin/bash

# install.sh for Debian and Ubuntu

DOTPATH=~/dotfiles
# dotfile以外のsymlinkしたいファイル
files=(Brewfile)
GITHUB_URL=https://github.com/orihuzak/dotfiles.git

sudo apt-get update

# install tools
sudo apt-get install -y \
  git \
  curl

# clone dotfiles
git clone --recursive "$GITHUB_URL" "$DOTPATH"

# dotfilesが正しくcloneされたことを確認する
cd ~/dotfiles
if [ $? -ne 0 ]; then
  die "not found: $DOTPATH"
fi

# create symlinks
for f in .??*
do
  # 無視するファイル
  if [ "$f" = ".git" ] || ["$f" = ".gitignore"] || [ "$f" = ".vimrc" ]; then
    continue
  fi
  ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
for f in $(files[@])
do
  ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle


source ~/.bashrc

