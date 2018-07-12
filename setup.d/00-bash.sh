#!/bin/bash
# better be reentrant

TOP=$(realpath $(pwd)/$(dirname $0)/..)

# bashrc sourced by interactive & non-login bash
echo "source \"$TOP/res/bashrc\"" >> $HOME/.bashrc

mkdir -p $HOME/.ssh
ln -snf $TOP/res/ssh-config $HOME/.ssh/config

mkdir -p $HOME/app

mkdir -p $HOME/bin
ln -snf /usr/bin/gnome-calculator $HOME/bin/calc
ln -snf /usr/bin/gnome-terminal $HOME/bin/cmd
ln -snf /usr/bin/google-chrome $HOME/bin/chrome

mkdir -p $HOME/pub
ln -snf $HOME/pub $HOME/Downloads
