#!/bin/bash

TOP=$(realpath $(pwd)/$(dirname $0)/..)

sudo apt-get install -y tmux

ln -snf $TOP/res/tmux.conf $HOME/.tmux.conf
