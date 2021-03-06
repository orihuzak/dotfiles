# aliases setting file


## command aliases


alias shells='cat /etc/shells'
alias shell="echo $SHELL"
alias reload='exec $SHELL -l'
alias restart='exec $SHELL -l'
alias relogin='exec $SHELL -l'

# list PATH
alias showpath='echo $PATH | sed -e "s/:/\n/g"'

# list
alias ls='ls --color=auto'
alias ll='ls -lha'

# tree
alias tree='tree -a -I "\.DS_Store|\.git|node_modules" -N'

# bat
if is_exists bat; then
  alias cat='bat'
fi

# git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias gp='git push'
# search
alias gg='git grep'

# docker
alias dcr='docker-compose run --rm'
# nvim
alias vi='nvim'
alias vim='nvim'

# apt
alias ap='sudo apt'
alias api='sudo apt install'
alias apr='sudo apt remove'
alias apu='sudo apt update'
alias apug='sudo apt upgrade'
alias aps='sudo apt search'

# apt-get
alias apg='sudo apt-get'
alias apgi='sudo apt-get install'
alias apgr='sudo apt-get remove'
alias apgu='sudo apt-get update'
alias apgug='sudo apt-get upgrade'
alias apgs='sudo apt-get search'

# homebrew
alias br='brew'
alias bri='brew install'
alias brui='brew uninstall'
alias bru='brew update'
alias brug='brew upgrade'
alias brd='brew doctor'
alias brc='brew cleanup'
alias brl='brew list'
alias brs='brew search'

function upgradeAllPackages() {
  echo -e "\nsudo apt-get update"
  sudo apt-get update
  echo -e "\nsudo apt-get upgrade -y"
  sudo apt-get upgrade -y
  echo -e "\nsudo apt-get autoclean"
  sudo apt-get autoremove
  echo -e "\nbrew update"
  brew update
  echo -e "\nbrew upgrade"
  brew upgrade
  echo -e "\nbrew cleanup"
  brew cleanup
  echo -e "\ndeno upgrade"
  deno upgrade
  if is_exists rustup; then
    echo -e "\nrust update"
    rustup update
  fi
  echo -e "\nall upgrade process done."
}

alias allug=upgradeAllPackages

# python
alias python='python3'
alias pip='pip3'

# deno
alias de='deno'
alias deug='deno upgrade'

# t
if is_exists t; then
  alias tw='t'
fi

# nnn
if is_exists nnn; then
  alias nnn='nnn -H'
  alias nn='nnn'
fi

# tldr
if is_exists tldr; then
  alias tld='tldr'
fi

# youtube-dl
alias ydl='youtube-dl'

# download video and audio

# youtube liveの最高品質のhls urlを取得する
alias yhls='youtube-dl -f best -g'

alias yaudio="youtube-dl --extract-audio"
# ライブ配信の音声をホームディレクトリにDLする
alias ylive="youtube-dl --hls-use-mpegts --extract-audio"
alias ylivef="youtube-dl --hls-prefer-ffmpeg --hls-use-mpegts --extract-audio"


# video and audio file management

alias tomp3='~/dotfiles/tomp3.sh'
alias tom4a='~/dotfiles/tom4a.sh'
alias avconcat='~/dotfiles/avconcat.sh' # concat audio or video files
# avconcatで連結したいファイルを書く~/mylist.txtをすぐに編集するためのalias
alias mylist='vim ~/mylist.txt'

## change directory

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
# google drive
# - 環境に合わせてgdriveのpathを変える
if is_exists cmd.exe; then
  alias gdrive='cd /mnt/d/GoogleDrive'
  alias vw='cd /mnt/d/GoogleDrive/vimwiki'
elif [ -d /mnt/chromeos ]; then
  alias gdrive='cd /mnt/chromeos/GoogleDrive/MyDrive'
  alias vw='cd /mnt/chromeos/GoogleDrive/MyDrive/vimwiki'
  alias gkoe='cd /mnt/chromeos/GoogleDrive/MyDrive/koe'
  alias koe='cd ~/koe'
  alias koedl='cd ~/koe-dl'
fi

alias game='cd ~/game'
alias dot='cd ~/dotfiles'
alias dotfiles='cd ~/dotfiles'
alias dev='cd ~/dev'
alias lab='cd ~/lab'

# generate ssh key
alias genssh='ssh-keygen -t rsa -b 4096 -C "arx.solid@gmail.com"'

