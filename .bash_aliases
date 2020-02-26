################################################################################
## aliases setting file
################################################################################

################################################################################
# command aliases
################################################################################
alias ll='ls -lha'
# docker
alias dcr='docker-compose run --rm'
# nvim
alias vi='nvim'
alias vim='nvim'
# apt
# alias api='sudo apt install'
# alias apr='sudo apt remove'
# alias apu='sudo apt update'

################################################################################
# change directory
################################################################################
alias gdrive='cd /mnt/chromeos/GoogleDrive/MyDrive' # cd to google drive
alias tokoe='cd /mnt/chromeos/GoogleDrive/MyDrive/koe' # cd to GoogleDrive/koe

################################################################################
# download video and audio
################################################################################
# youtube liveの最高品質のhls urlを取得する
alias gethls='youtube-dl -f best -g'
# youtubeから音声をカレントディレクトリにDLする
alias getaudio='youtube-dl --extract-audio'
# youtubeから音声をDLするためのalias
alias reina="youtube-dl -o '~/koe/reina-yuzuki/柚木玲奈-%(release_date)s-%(title)s.%(ext)s' --extract-audio"
alias rin="youtube-dl -o '~/koe/rin-yuzuki/柚木凛-%(release_date)s-%(title)s.%(ext)s' --extract-audio"
# open youtube live with vlc without video
alias vlcaudio='vlc --no-video'

################################################################################
# video and audio file management
################################################################################
alias tomp3='~/dotfiles/tomp3.sh'
alias tom4a='~/dotfiles/tom4a.sh'
alias avconcat='~/dotfiles/avconcat.sh' # concat audio or video files
# avconcatで連結したいファイルを書く~/mylist.txtをすぐに編集するためのalias
alias mylist='vim ~/mylist.txt'


# setup ssh-agent
if [ -f ~/.ssh-agent ]; then
  . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
  ssh-agent > ~/.ssh-agent
  . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add
