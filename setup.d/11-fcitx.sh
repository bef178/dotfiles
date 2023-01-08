#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi


sudo apt-get -y update

sudo apt-get -y install fcitx-bin fcitx-googlepinyin fcitx-table-wbpy

echo
echo "Next:"
echo "1. change fcitx hotkey: trigger input method: Rctrl"
echo "2. backup and modify xkb config \`/usr/share/X11/xkb/symbols/pc\`:"
echo "     key <CAPS> {        [ Control_R, Caps_Lock  ]       };"
echo "3. reboot"
