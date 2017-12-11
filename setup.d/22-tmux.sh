#!/bin/bash

root=$1

sudo apt-get install -y tmux

if test ! -e $HOME/.tmux.conf; then
    ln -s $root/tmux.conf $HOME/.tmux.conf
fi
