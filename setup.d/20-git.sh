#!/bin/bash

DROOT=$1

sudo apt-get install -y git

if test ! -e $HOME/.gitconfig; then
    ln -s $DROOT/res/gitconfig $HOME/.gitconfig
fi
