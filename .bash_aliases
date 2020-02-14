################################################################################
## aliases setting file
################################################################################

alias ll='ls -lha'

# apt
# alias api='sudo apt install'
# alias apr='sudo apt remove'
# alias apu='sudo apt update'

# docker
alias dcr='docker-compose run --rm'

# aliases
alias tomp3='~/dotfiles/tomp3.sh'
alias tom4a='~/dotfiles/tom4a.sh'
# concat audio or video files
alias avconcat='~/dotfiles/avconcat.sh'
# avconcatで連結したいファイルを書く~/mylist.txtをすぐに編集するためのalias
alias mylist='vim ~/mylist.txt'
# open youtube live with vlc without video
alias vlcaudio='vlc --no-video'
# cd to google drive
alias gdrive='cd /mnt/chromeos/GoogleDrive/MyDrive'
# cd to GoogleDrive/koe
alias tokoe='cd /mnt/chromeos/GoogleDrive/MyDrive/koe'
# youtubeから音声をカレントディレクトリにDLする
alias getaudio='youtube-dl --extract-audio'
# youtube liveの最高品質のhls urlを取得する
alias gethls='youtube-dl -f best -g'
# youtubeから音声をDLするためのalias
alias reina="youtube-dl -o '~/koe/reina-yuzuki/柚木玲奈-%(upload_date)s-%(title)s.%(ext)s' --extract-audio"
alias rin="youtube-dl -o '~/koe/rin-yuzuki/柚木凛-%(upload_date)s-%(title)s.%(ext)s' --extract-audio"
alias moa="youtube-dl -o '~/koe/moa-madoromi/まどろみもあ-%(upload_date)s-%(title)s.%(ext)s' --extract-audio"

# setup ssh-agent
if [ -f ~/.ssh-agent ]; then
  . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
  ssh-agent > ~/.ssh-agent
  . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add
