# short primary prompt string
export PS1="\[\033[38;5;40m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;33m\]>\[$(tput sgr0)\]\[\033[38;5;45m\]>\[$(tput sgr0)\]\[\033[38;5;87m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias ll='ls -la'

# apt
# alias api='sudo apt install'
# alias apr='sudo apt remove'
# alias apu='sudo apt update'

# docker
alias dcr='docker-compose run --rm'

# my command
alias tomp3='~/dotfiles/tomp3.sh'
alias tom4a='~/dotfiles/tom4a.sh'
# concat audio or video files
alias avconcat='~/dotfiles/avconcat.sh'
# youtubeから音声をカレントディレクトリにDLする
alias getaudio='youtube-dl --extract-audio'
# youtube liveの最高品質のhls urlを取得する
alias gethls='youtube-dl -f best -g'
# open youtube live with vlc without video
alias vlcaudio='vlc --no-video'

# cd to google drive
alias gdrive='cd /mnt/chromeos/GoogleDrive/MyDrive'

# setup ssh-agent
if [ -f ~/.ssh-agent ]; then
  . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
  ssh-agent > ~/.ssh-agent
  . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add

# PATHの追加と削除を容易にする関数
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

# add path for crostini
export PATH=$PATH:/home/arxsolid/.local/bin
