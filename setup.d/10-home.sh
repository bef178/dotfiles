#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

if [[ `uname -a` == *Microsoft* ]]; then
    export WIN_USER=`cmd.exe /C "echo %USERNAME%" | tr -d '\r'`
fi

################
# directory
#

if test -n "$WIN_USER"; then
    umask 022
fi

if test -n "$WIN_USER"; then
    ln -snf "/mnt/c/Users/${WIN_USER}/Downloads" $HOME/Downloads
else
    rmdir --ignore-fail-on-non-empty $HOME/{Documents,Movie,Music,Pictures,Public,Templates,Videos}
fi

mkdir -p $HOME/bin

mkdir -p $HOME/pub

mkdir -p $HOME/.ssh
if test ! -e $HOME/.ssh/config; then
    ln -snf $TOP/res/ssh-config $HOME/.ssh/config
fi

################
# dotfiles
#

# bashrc sourced by interactive & non-login bash
# TODO be reentrant
echo >> $HOME/.bashrc
cat >> $HOME/.bashrc << EOF
source $TOP/res/ps1.sh
source $TOP/res/bashrc.sh
source $TOP/res/promise-ssh-agent.sh
source $TOP/res/term-solarized.sh
EOF

cat >> $HOME/.bashrc << EOF
export PATH=\$HOME/bin:\$PATH
EOF
