#!/bin/bash

TOP=$(realpath $(pwd)/$(dirname $0)/..)

sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update

sudo apt-get install -y git

if test ! -e $HOME/.gitconfig; then
    ln -snf $TOP/res/gitconfig $HOME/.gitconfig
fi
