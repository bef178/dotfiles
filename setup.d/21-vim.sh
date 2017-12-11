#!/bin/bash

root=$1

sudo apt-get install -y vim

if test ! -e $HOME/.vim; then
    mkdir -p $HOME/.vim
    ln -s $HOME/.vim/vimrc $HOME/.vimrc
    ln -s $root/vim/vimrc $HOME/.vim/vimrc
    ln -s $root/vim/vundle.vim $HOME/.vim/vundle.vim
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    mkdir -p $HOME/.vim/colors
    cp $root/vim/colors/*.vim $HOME/.vim/colors
fi
