#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

rmdir --ignore-fail-on-non-empty $HOME/{Documents,Movie,Music,Pictures,Public,Templates,Videos}

mkdir -p $HOME/bin
cat >> $HOME/.bashrc << EOF

export PATH=\$HOME/bin:\$PATH
EOF

if [[ `uname -a` == *Microsoft* ]]; then
    # wsl
    source $TOP/setup.d/win.10-home.sh
fi

# .bashrc sourced by interactive & non-login bash
# TODO be reentrant
cat >> $HOME/.bashrc << EOF

source $TOP/res/alias.sh
source $TOP/res/term-palette-solarized.sh
source $TOP/res/ps1.sh
source $TOP/res/gui-settings.sh
EOF

cat >> $HOME/.inputrc << EOF

# do not bell on tab-completion
set bell-style none
EOF
