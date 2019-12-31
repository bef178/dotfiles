#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

# vim
sudo apt-get install -y vim
ln -snf $TOP/res/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim
ln -snf $TOP/res/vim/colors $HOME/.vim/colors

# tmux
sudo apt-get install -y tmux
ln -snf $TOP/res/tmux.conf $HOME/.tmux.conf

# git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
ln -snf $TOP/res/gitconfig $HOME/.gitconfig
