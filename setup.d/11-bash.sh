#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

# TODO be reentrant
# bashrc sourced by interactive & non-login bash
cat >> $HOME/.bashrc << EOF

source $TOP/res/bashrc
EOF
