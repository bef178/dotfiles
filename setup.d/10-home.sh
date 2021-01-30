#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

if [[ `uname -a` == *Microsoft* ]]; then
    # wsl
    export WIN_USER=`cmd.exe /C "echo %USERNAME%" | tr -d '\r'`
fi

################
# directory
#

if test -n "$WIN_USER"; then
    umask 022
fi

rmdir --ignore-fail-on-non-empty $HOME/{Documents,Movie,Music,Pictures,Public,Templates,Videos}
if test -n "$WIN_USER"; then
    # link Downloads to windows' Downloads folder
    rmdir --ignore-fail-on-non-empty $HOME/Downloads
    ln -snf "/mnt/c/Users/${WIN_USER}/Downloads" $HOME/Downloads
fi
if test ! -e $HOME/pub; then
    ln -snf $HOME/Downloads $HOME/pub
fi

mkdir -p $HOME/bin

################
# dotfiles
#

# .bashrc sourced by interactive & non-login bash
# TODO be reentrant
echo >> $HOME/.bashrc
cat >> $HOME/.bashrc << EOF
source $TOP/res/alias.sh
source $TOP/res/term-palette-solarized.sh
source $TOP/res/ps1.sh
source $TOP/res/gui-settings.sh
EOF

cat >> $HOME/.bashrc << EOF

export PATH=\$HOME/bin:\$PATH
EOF
