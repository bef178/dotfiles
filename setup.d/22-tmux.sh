#!/bin/bash

ROOT=$1

sudo apt-get install -y tmux

ln -snf $ROOT/res/tmux.conf $HOME/.tmux.conf
