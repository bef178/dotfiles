#!/bin/bash

TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)

rmdir --ignore-fail-on-non-empty $HOME/{Documents,Downloads,Movie,Music,Pictures}

mkdir -p $HOME/{app,bin}
cat >> $HOME/.bashrc << EOF

# home bin
export PATH=$PATH:$HOME/bin
EOF

mkdir -p $HOME/pub
if test ! -e $HOME/Downloads; then
    ln -snf $HOME/pub $HOME/Downloads
fi

mkdir -p $HOME/.ssh
if test ! -e $HOME/.ssh/config; then
    ln -snf $TOP/res/ssh-config $HOME/.ssh/config
fi
