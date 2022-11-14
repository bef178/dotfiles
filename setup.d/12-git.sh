#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi


sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update

sudo apt-get install -y git

ln -snf $TOP/setup.d/git/x.gitconfig $HOME/.gitconfig
