#!/bin/bash
# better be reentrant

ROOT="$1"

# bashrc sourced by interactive & non-login bash
echo "source \"$ROOT/res/bashrc\"" >> $HOME/.bashrc

mkdir -p $HOME/.ssh
ln -snf $ROOT/res/ssh-config $HOME/.ssh/config

mkdir -p $HOME/app

mkdir -p $HOME/bin
ln -snf /usr/bin/gnome-calculator $HOME/bin/calc
ln -snf /usr/bin/gnome-terminal $HOME/bin/cmd
ln -snf /usr/bin/google-chrome $HOME/bin/chrome

mkdir -p $HOME/pub
ln -snf $HOME/pub $HOME/Downloads

#### bash on windows

uname -a | grep Microsoft >/dev/null
if test $? -ne 0; then
    exit
fi

mkdir -p $HOME/workshop
sudo ln -snf $HOME/workshop /workshop

WIN_USER_HOME=/mnt/c/Users/$USER

# TODO make $HOME links to /mnt/d/$USER

ln -snf $WIN_USER_HOME/Downloads $HOME/pub

# vim on windows
cat >$WIN_USER_HOME/_vimrc <<EOF
source D:\\$USER\\.vimrc
EOF
