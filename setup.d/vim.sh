#!/bin/bash

if [[ "$0" == /* ]]; then
    TOP=$(realpath $(dirname $0)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $0)/..)
fi

sudo apt-get install -y vim

ln -snf $TOP/res/vimrc $HOME/.vimrc

mkdir -p $HOME/.vim
ln -snf $TOP/res/vim/colors $HOME/.vim/colors
