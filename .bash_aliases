# short primary prompt string
# export PS1="\[\e[34m\]\w\[\e[m\]\[\e[32m\]\\$\[\e[m\] "
# export PS1="\[\e[34m\]\w\[\e[m\] \[\e[35m\]>\[\e[m\]\[\e[36m\]>\[\e[m\]\[\e[35m\]>\[\e[m\] "
export PS1="\[\e[42m\]\u\[\e[m\]\[\e[32m\]▶\[\e[m\]\[\e[46m\]\w\[\e[m\]\[\e[36m\]▶\[\e[m\] "
# export PS1='\[\e[30;47m\] \t \[\e[37;46m\]\[\e[30m\] \W \[\e[36;49m\]\[\e[0m\] '

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
