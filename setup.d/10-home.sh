#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi


rmdir --ignore-fail-on-non-empty $HOME/{Documents,Movie,Music,Pictures,Public,Templates,Videos}


mkdir -p $HOME/bin


# .bashrc sourced by interactive & non-login bash TODO be reentrant
echo >> $HOME/.bashrc
cat >> $HOME/.bashrc << EOF
. $TOP/res.d/alias.sh
. $TOP/res.d/ps1.sh
EOF


echo >> $HOME/.inputrc
cat >> $HOME/.inputrc << EOF
# do not bell on tab-completion
set bell-style none
EOF
