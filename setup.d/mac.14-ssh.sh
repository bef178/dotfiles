#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

# ssh
brew install ssh
mkdir -p $HOME/.ssh
if test ! -e $HOME/.ssh/config; then
    ln -snf $TOP/res/secret/sshconfig $HOME/.ssh/config
fi
