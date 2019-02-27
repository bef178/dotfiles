#!/bin/bash

if [[ "$0" == /* ]]; then
    TOP=$(realpath $(dirname $0)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $0)/..)
fi

sudo apt-get install -y tmux

ln -snf $TOP/res/tmux.conf $HOME/.tmux.conf
