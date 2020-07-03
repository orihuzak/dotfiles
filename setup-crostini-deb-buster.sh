#!/bin/bash

# setup crostini
# install packages 
# clone dotfiles directory on github
# symlink dotfiles to home diretory from dotfiles directory

DOTPATH=~/dotfiles
# ここを別のrepositoryに変えれば他のrepoでも使える
GITHUB_URL=https://github.com/orihuzak/dotfiles.git

getNodejs() {
  # install nodejs13
  # see https://github.com/nodesource/distributions
  curl -sL https://deb.nodesource.com/setup_13.x | sudo  bash -
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
  code --install-extension Shan.code-settings-sync
  # この拡張だけインストールすればあとはこの拡張機能がやってくれるはず
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

getFiraCode() {
  # Firacode
  #   https://github.com/tonsky/FiraCode
  # see FiraCode release
  #   https://github.com/tonsky/FiraCode/releases/
  # how to use
  #   set "Fira Code"
  curl -OL https://github.com/tonsky/FiraCode/releases/download/2/FiraCode_2.zip
  unzip FiraCode_2.zip -d FiraCode_2
  sudo cp ./FiraCode_2/otf/* /usr/local/share/fonts
  sudo fc-cache -fv
  # if you want to remove FiraCode_2.zip and ./FiraCode_2 directory, remove comment out below
  # sudo rm -r ./FiraCode_2.zip ./FiraCode_2
}

getFcitx() {
  # install fcitx-mozc ime
  sudo apt-get install fcitx-mozc
  # set fcitx autostart
  echo \
    "Environment='GTK_IM_MODULE=fcitx' \
    Environment='QT_IM_MODULE=fcitx' \
    Environment='XMODIFIERS=@im=fcitx'" |
    sudo tee -a /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
  echo "/usr/bin/fcitx-autostart" | sudo tee -a ~/.sommelierrc
}

getTrashCLI() {
  # install trash-cli, cli trashcan package
  # see https://github.com/andreafrancia/trash-cli
  git clone https://github.com/andreafrancia/trash-cli.git
  cd trash-cli
  sudo python setup.py install
}

getHomebrew() {
  # install homebrew(linuxbrew)
  # see https://docs.brew.sh/Homebrew-on-Linux
  sudo apt-get install build-essential curl file git
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  # PATHを追加
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
}


getUlauncher() {
  # install Ulauncher
  # see https://ulauncher.io/
  wget https://github.com/Ulauncher/Ulauncher/releases/download/5.6.1/ulauncher_5.6.1_all.deb
  sudo dpkg -i ulauncher_5.6.1_all.deb
  sudo apt install -f
}

getHyper() {
  # install hyper
  # see https://github.com/zeit/hyper/
  curl -OL https://github.com/zeit/hyper/releases/download/3.0.2/hyper_3.0.2_amd64.deb
  sudo dpkg -i hyper_3.0.2_amd64.deb
  sudo apt-get install -f
}

getNerdFonts() {
  # install Nerd Fonts
  # see https://github.com/ryanoasis/nerd-fonts#option-1-download-and-install-manually
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otfi
  fc-cache -fv
  cd ~
}

getVim-plug() {
  # install vim-plug for neovim
  # see https://github.com/junegunn/vim-plug
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

sudo apt-get update
# repositoryの追加
echo "deb http://ftp.jp.debian.org/debian $(lsb_release -cs) main" \
  | sudo tee -a /etc/apt/sources.list
# 必要なパッケージのインストール
sudo apt-get install -y \
  git \
  curl \
  wget \
  zip \
  software-properties-common \
  tree \
  vlc

# fonts
getSourceHanCodeJP
getNerdFonts
# getFiraCode

# CUI tools
getFcitx
getTrashCLI
getVim-plug
getNodejs
getHomebrew
getDocker
# getYoutubeDL

# GUI tools
getHyper
getVSCode

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