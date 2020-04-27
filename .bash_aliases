
# aliases setting file

#===============================================================================

# command aliases

alias ll='ls -lha'

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

# apt-get 
alias ag='sudo apt-get'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias agug='sudo apt-get upgrade'

# homebrew
alias br='brew'
alias bri='brew install'
alias bru='brew update'
alias brug='brew upgrade'
alias brl='brew list'

# change directory

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias gdrive='cd /mnt/chromeos/GoogleDrive/MyDrive' # cd to google drive
alias gkoe='cd /mnt/chromeos/GoogleDrive/MyDrive/koe' # cd to GoogleDrive/koe
alias koe='cd ~/koe'
alias koedl='cd ~/koe-dl'
alias game='cd ~/game'
alias dot='cd ~/dotfiles'
alias dotfiles='cd ~/dotfiles'
alias work='cd ~/work'


# download video and audio

alias dlaudio="youtube-dl --extract-audio"
# youtube liveの最高品質のhls urlを取得する
alias gethls='youtube-dl -f best -g'
# ライブ配信の音声をホームディレクトリにDLする
alias dllive="youtube-dl --hls-use-mpegts --extract-audio -o '~/$(date +'%Y%m%d')-%(title)s.%(ext)s'"
alias dllivef="youtube-dl --hls-prefer-ffmpeg --hls-use-mpegts --extract-audio -o '~/$(date +'%Y%m%d')-ffmpeg-%(title)s.%(ext)s'"

# 特定のチャンネル向けのDL alias, ライブ終了直後に実行する
alias reina="youtube-dl -o '~/koe/reina/柚木玲奈-$(date +'%Y%m%d')-%(title)s.%(ext)s' --extract-audio"
alias rin="youtube-dl -o '~/koe/rin/柚木凛-$(date +'%Y%m%d')-%(title)s.%(ext)s' --extract-audio"
alias moa="youtube-dl -o '~/koe/moa/まどろみもあ-$(date +'%Y%m%d')-%(title)s.%(ext)s' --extract-audio"
# open youtube live with vlc without video
alias vlcaudio='vlc --no-video'


# video and audio file management

alias tomp3='~/dotfiles/tomp3.sh'
alias tom4a='~/dotfiles/tom4a.sh'
alias avconcat='~/dotfiles/avconcat.sh' # concat audio or video files
# avconcatで連結したいファイルを書く~/mylist.txtをすぐに編集するためのalias
alias mylist='vim ~/mylist.txt'

# generate ssh key
alias genssh='ssh-keygen -t rsa -b 4096 -C "arx.solid@gmail.com"'

# setup ssh-agent

if [ -f ~/.ssh-agent ]; then
  . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
  ssh-agent > ~/.ssh-agent
  . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add


