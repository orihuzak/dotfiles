#!/bin/bash
# symlink files for wsl2 Ubuntu

DOTPATH=~/dotfiles
files=(.bash_aliases .profile .vimrc Brewfile)

cd "$DOTPATH"
if [ $? -ne 0 ]; then
  die "not found: $DOTPATH"
fi

for f in ${files[@]}
do 
  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
