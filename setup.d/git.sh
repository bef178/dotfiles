#!/bin/bash

if [[ "$0" == /* ]]; then
    TOP=$(realpath $(dirname $0)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $0)/..)
fi

sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update

sudo apt-get install -y git

ln -snf $TOP/res/gitconfig $HOME/.gitconfig
