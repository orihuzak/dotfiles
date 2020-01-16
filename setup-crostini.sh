#!/bin/bash

# setup crostini
# install packages 
# clone dotfiles directory on github
# symlink dotfiles to home diretory from dotfiles directory

DOTPATH=~/dotfiles
# ここを別のrepositoryに変えれば他のrepoでも使える
GITHUB_URL=https://github.com/orihuzak/dotfiles.git

getNodejs() {
  # installするversionを変えたいときはsetup_12をsetup_13のように変える
  # 詳しくはhttps://github.com/nodesource/distributions
  curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
  sudo apt-get install -y nodejs
  # install yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install yarn
}

getDocker() {
  # 詳しくはhttps://docs.docker.com/install/linux/docker-ce/debian/
  sudo apt-get update
  sudo apt-get install \
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
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
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
  sudo apt-get install apt-transport-https
  sudo apt-get update
  sudo apt-get install code
  # install extension
  # たぶんこれだけインストールすればあとはこの拡張機能がやってくれるはず
  code --install-extension Shan.code-settings-sync
}

getYoutubeDL() {
  # see https://github.com/ytdl-org/youtube-dl#installation
  sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
  sudo chmod a+rx /usr/local/bin/youtube-dl
}

getSourceHanCodeJP() {
  # 参考 https://www.axon.jp/entry/2018/10/18/201812
  # you can get other versions from https://github.com/adobe-fonts/source-han-code-jp/releases
  # how to use
  #   set "Source Han Code JP"
  curl -OL https://github.com/adobe-fonts/source-han-code-jp/archive/2.011R.tar.gz
  tar zxf 2.011R.tar.gz
  sudo cp ./source-han-code-jp-2.011R/OTF/* /usr/local/share/fonts
  sudo fc-cache -fv
  
  # if you want to remove ./source-han-code-jp-2.011R and 2.011R.tar.gz, remove comment out below
  # sudo rm 2.011R.tar.gz
  # sudo rm -r ./source-han-code-jp-2.011R
}

getFcitx() {
  # install fcitx-mozc ime
  sudo apt-get install fcitx-mozc
  # set fcitx autostart
  echo \
    "Environment='GTK_IM_MODULE=fcitx' \
    Environment='QT_IM_MODULE=fcitx' \
    Environment='XMODIFIERS=@im=fcitx'" \
    | sudo tee -a /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
  echo "/usr/bin/fcitx-autostart" | sudo tee -a ~/.sommelierrc
}


# 必要なパッケージのインストール
sudo apt-get update
sudo apt-get install -y git curl wget software-properties-common ffmpeg vlc
getSourceHanCodeJP
getFcitx
getYoutubeDL
getNodejs
getVSCode
getDocker

# dotfilesをgithubからcloneする
git clone "$GITHUB_URL" "$DOTPATH"
# dotfilesに移動
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
source ~/.bashrc
