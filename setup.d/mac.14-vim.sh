#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

# vim
brew install vim
ln -snf $TOP/res/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim
