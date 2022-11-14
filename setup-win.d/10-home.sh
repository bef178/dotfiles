#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi


umask 022


export WIN_USER=`cmd.exe /C "echo %USERNAME%" | tr -d '\r'`
export WIN_HOME=/mnt/c/Users/$WIN_USER


rmdir --ignore-fail-on-non-empty $HOME/Downloads
ln -snf "/mnt/c/Users/${WIN_USER}/Downloads" $HOME/Downloads
