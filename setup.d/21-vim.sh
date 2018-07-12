#!/bin/bash

TOP=$(realpath $(pwd)/$(dirname $0)/..)

sudo apt-get install -y vim

ln -snf $TOP/res/vim/vimrc $HOME/.vimrc

mkdir -p $HOME/.vim/colors
cp $TOP/res/vim/colors/*.vim $HOME/.vim/colors/

# windows subsystem linux
uname -a | grep Microsoft >/dev/null
if test $? -ne 0; then
    exit
fi

cat > /mnt/c/Users/$USER/_vimrc << EOF
source $(echo $TOP/res/vim/vimrc | sed "s/\/mnt\/\([a-z]\)/\1:/" | sed "s/\//\\\\/g")
EOF
