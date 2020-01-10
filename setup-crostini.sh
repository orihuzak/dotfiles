#!/bin/bash

DOTPATH=~/dotfiles
# ここを別のrepositoryに変えれば他のrepoでも使える
GITHUB_URL=https://github.com/orihuzak/dotfiles.git

getNodejs() {
  # installするversionを変えたいときはsetup_12をsetup_13のように変える
  # 詳しくはhttps://github.com/nodesource/distributions
  curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
  sudo apt install -y nodejs
}

getDocker() {

}

getVSCode() {
  # install vscode
  # see https://code.visualstudio.com/docs/setup/linux
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
  sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt install apt-transport-https
  sudo apt update
  sudo apt install code
  # install extension
  # たぶんこれだけインストールすればあとはこの拡張機能がやってくれるはず
  code --install-extension Shan.code-settings-sync
}

# dotfilesをgithubからcloneする
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
sudo apt update


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