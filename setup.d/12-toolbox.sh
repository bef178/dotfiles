#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

sudo apt-get update
sudo apt-get install -y apt aptitude

# small tools
sudo apt-get install -y \
    wget curl axel \
    p7zip-full zip rar unrar \
    ascii testdisk tree \
    astyle


# vim
sudo apt-get install -y vim
ln -snf $TOP/setup.d/vim/x.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim

# tmux
sudo apt-get install -y tmux
ln -snf $TOP/setup.d/tmux/x.tmux.conf $HOME/.tmux.conf

# ssh
sudo apt-get install -y ssh
mkdir -p $HOME/.ssh
if test ! -e $HOME/.ssh/config; then
    ln -snf $TOP/setup.d/ssh/config $HOME/.ssh/config
fi
