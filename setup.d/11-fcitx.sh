#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi


sudo apt-get -y update

sudo aptitude install fcitx-bin fcitx-googlepinyin fcitx-table-wbpy

echo
echo

echo 1. change fcitx hotkey: trigger input method: Rctrl

echo 2. \#change xkb config
echo    backup /usr/share/X11/xkb/symbols/pc
echo    modify it:
echo    key <CAPS> {        [ Control_R, Caps_Lock  ]       };

echo 3. reboot
