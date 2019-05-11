#!/bin/bash
# better be reentrant

TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)

# bashrc sourced by interactive & non-login bash
echo "source \"$TOP/res/bashrc\"" >> $HOME/.bashrc

mkdir -p $HOME/app

mkdir -p $HOME/bin
ln -snf /usr/bin/gnome-calculator $HOME/bin/calc
ln -snf /usr/bin/gnome-terminal $HOME/bin/term
ln -snf /usr/bin/google-chrome $HOME/bin/chrome

mkdir -p $HOME/pub
ln -snf $HOME/pub $HOME/Downloads

mkdir -p $HOME/.ssh
ln -snf $TOP/res/ssh-config $HOME/.ssh/config
