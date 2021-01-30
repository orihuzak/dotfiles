# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 履歴ファイルの保存先
HISTFILE=~/.histfile
# メモリに保存される履歴の件数
HISTSIZE=1000
# HISTFILEに保存される履歴の件数
SAVEHIST=1000

# keymapの設定 vi like: -v, emacs like: -e
bindkey -e

# 自動補完
autoload -U compinit; compinit
# <Tab>で次の補完候補
zstyle ':comletion:*:default' menu select=1

# 入力した内容がコマンドでなく、ディレクトリ名と一致すればcdする
setopt auto_cd
# cdしたディレクトリをディレクトリスタックに追加
# ディレクトリスタックとは今までに行ったディレクトリの履歴
# `cd +<Tab>`でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd
# ディレクトリスタックの重複をさせない
setopt pushd_ignore_dups
# コマンド履歴の重複を削除
setopt hist_ignore_all_dups
# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 履歴に残したくないコマンドを入力するとき使う
# 例： <Space>echo hello と入力
setopt hist_ignore_space

# user functions

# Check if the command is exists
is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

# PATHの追加と削除を容易にする関数
# usage path_func("path/to/any")
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }


# load alias setting file
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

### zplug
case ${OSTYPE} in
  linux*)
    export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
    ;;
esac
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zsh theme
zplug "romkatv/powerlevel10k", as:theme
zplug "agnoster/agnoster-zsh-theme"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


### zplug section end !!!

# setup ssh-agent
if [ -f ~/.ssh-agent ]; then
  . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
  ssh-agent > ~/.ssh-agent
  . ~/.ssh-agent
fi
ssh-add -l >& /dev/null || ssh-add

