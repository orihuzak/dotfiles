#!/bin/bash

DOTPATH=~/dotfiles
# ここを別のrepositoryに変えれば他のrepoでも使える
GITHUB_URL=https://github.com/orihuzak/dotfiles.git
if has "git"; then
  git clone --recursive "$GITHUB_URL" "$DOTPATH"
# gitが使えない場合はcurlかwgetを使用する
elif has "curl" || has "wget"; then
  tarball="https://github.com/orihuzak/dotfiles/archive/master.tar.gz"
  # どちらかでDLしてtarに流す
  if has "curl"; then
    curl -L "$tarball"
  elif has "wget"; then
    wget -O - "$tarball"
  fi | tar zxv

  # 解凍したら, DOTPATHに置く
  mv -f dotfiles-master "$DOTPATH"
else
  die "curl or wget required"
fi

#必要なパッケージのインストール

cd "$DOTPATH"
if [ $? -ne 0 ]; then
  die "not found: $DOTPATH"
fi

# 移動できたらリンクを作成
for f in .??*
do
  # 除外したいファイル
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore"] && continue

  ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done