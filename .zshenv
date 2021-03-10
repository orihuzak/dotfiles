# .zshenv
# config environment vars

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
# export LANGUAGE="ja_JP:ja"

# 文字コード、ロケールを設定
export TREE_CHARSET="UTF-8"
# export LC_COLLATE="C"

# add paths
export PATH="$HOME/.local/bin:$PATH"
# linuxbrew(homebrew) path
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# yarn global package path
export PATH="$(yarn global bin):$PATH"
# Cargo's bin directory for Rust
export PATH="$HOME/.cargo/bin:$PATH"
# deno
export PATH="$HOME/.deno/bin:$PATH"
# rubygem
export PATH="/home/linuxbrew/.linuxbrew/lib/ruby/gems/2.7.0/bin:$PATH"

export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"


### user functions

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


# user commands settings
if is_exists fzf; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
fi

# 標準エディタの設定
if is_exists nvim; then
  export EDITOR=nvim
fi

# for wsl
if [ -d "/mnt/c" ]; then
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
  export LIBGL_ALWAYS_INDIRECT=true
  # autohotkeyのpathを通す
  export PATH="$PATH:/mnt/c/Program Files/AutoHotkey"
fi

### Complete Messages
echo "Loding .zshenv completed!!"

