#!/bin/bash

root=$1

sudo apt-get install -y git

if test ! -e $HOME/.gitconfig; then
    ln -s $root/git/gitconfig $HOME/.gitconfig
fi
