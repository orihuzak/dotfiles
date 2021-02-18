# .zshenv
# config environment vars

# export LANG=ja_JP.UTF-8
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

# 標準エディタの設定
export EDITOR=nvim

# for wsl
if [ -d "/mnt/c" ]; then
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
  export LIBGL_ALWAYS_INDIRECT=true
  # autohotkeyのpathを通す
  export PATH="$PATH:/mnt/c/Program Files/AutoHotkey"
fi

### Complete Messages
echo "Loding .zshenv completed!!"

