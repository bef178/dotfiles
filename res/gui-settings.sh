#!/bin/bash

# disable touchpad
synclient touchpadoff=1 2>/dev/null

# disable auto-mount-open
if test -e "`which gsettings`"; then
    gsettings set org.gnome.desktop.media-handling automount-open false
fi

# elementary os 5.1 hera
if grep "elementary OS " /etc/issue >/dev/null; then
    # double click to open files and folders
    gsettings set io.elementary.files.preferences single-click false
fi
