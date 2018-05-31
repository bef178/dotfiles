#!/bin/bash

# bashrc sourced by interactive & non-login bash

DROOT="$1"

echo "source \"$DROOT/res/bashrc\"" >> $HOME/.bashrc

mkdir -p $HOME/.ssh
ln -snf $DROOT/res/ssh-config $HOME/.ssh/config

mkdir $HOME/app

mkdir $HOME/bin
ln -s /usr/bin/gnome-calculator bin/calc
ln -s /usr/bin/gnome-terminal bin/cmd
ln -s /usr/bin/google-chrome bin/chrome

mkdir $HOME/pub
ln -snf $HOME/pub $HOME/Downloads
