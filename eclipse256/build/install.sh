#!/bin/bash

if [[ "$0" == /* ]]; then
    TOP=$(realpath $(dirname -- $0)/..)
else
    TOP=$(realpath $(pwd)/$(dirname -- $0)/..)
fi

mkdir -p $HOME/.vim/colors
for i in $(\ls $TOP/vim/colors/*.vim); do
    ln -s $i $HOME/.vim/colors/
done
