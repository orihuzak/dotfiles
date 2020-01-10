#!/bin/bash

DOTPATH=~/dotfiles
# ここを別のrepositoryに変えれば他のrepoでも使える
GITHUB_URL=https://github.com/orihuzak/dotfiles.git

getNodejs() {
  # installするversionを変えたいときはsetup_12をsetup_13のように変える
  # 詳しくはhttps://github.com/nodesource/distributions
  curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
  sudo apt install -y nodejs
  # install yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install yarn
}

getDocker() {
  # 詳しくはhttps://docs.docker.com/install/linux/docker-ce/debian/
  sudo apt update
  sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io
  # post install steps
  # sudoなしでdockerを使う
  sudo groupadd docker
  sudo usermod -aG docker $USER
  # install docker-compose
  # 詳しくはhttps://docs.docker.com/compose/install/
  # installするversionを変更したいときは1.25.0の部分を変える
  sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
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


getYoutubeDL() {
  # see https://github.com/ytdl-org/youtube-dl#installation
  sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
  sudo chmod a+rx /usr/local/bin/youtube-dl
}

#必要なパッケージのインストール
sudo apt update
# ffmpeg vlc
sudo apt install ffmpeg vlc

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