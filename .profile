#******************************************************************************
#
# .profile
#
# 環境変数などの設定
# 
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022
#
#******************************************************************************

# LANG
# export LANG=ja_JP.UTF-8
# export LANGUAGE="ja_JP:ja"

# tree
# 文字コード、ロケールを設定
export TREE_CHARSET='UTF-8'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

### Complete Messages
echo "Loding .profile completed!!"
