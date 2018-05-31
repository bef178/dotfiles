#!/bin/bash

DROOT=$1

sudo apt-get install -y vim

ln -snf $DROOT/res/vim/vimrc $HOME/.vimrc

mkdir -p $HOME/.vim/colors
cp $DROOT/res/vim/colors/*.vim $HOME/.vim/colors/
