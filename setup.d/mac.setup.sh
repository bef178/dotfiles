#!/bin/bash
# run once

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

brew install \
    coreutils gnu-tar gnu-sed \
    findutils grep \
    #gawk gnutls gnu-indent gnu-getopt \

brew install \
    bash-completion docker-completion pip-completion yarn-completion

brew install vim
ln -snf $TOP/res.d/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim

brew install git
ln -snf $TOP/res.d/gitconfig $HOME/.gitconfig

brew install tmux
ln -snf $TOP/res.d/tmuxconfig $HOME/.tmux.conf

brew install openssh
mkdir -p $HOME/.ssh



cat >> $HOME/.zshrc << EOF

source $TOP/res.d/alias.sh
source $TOP/res.d/ps1.sh

export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH:$HOME/bin
EOF



cat >> $HOME/.inputrc << EOF

# do not bell on tab-completion
set bell-style none
EOF
