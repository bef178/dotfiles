#!/bin/bash

DROOT=$1

sudo apt-get install -y tmux

if test ! -e $HOME/.tmux.conf; then
    ln -s $DROOT/res/tmux.conf $HOME/.tmux.conf
fi
