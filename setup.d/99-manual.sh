#!/bin/bash

# input method: fcitx
#APKG="$APKG    \
#   fcitx   \
#   fcitx-frontend-gtk3 fcitx-ui-classic    \
#   fcitx-pinyin fcitx-table-wubi fcitx-table-wbpy  \
#   fcitx-googlepinyin\
#"

# gnome
# sudo aptitude install \
#   gnome   \
#   gnome-shell \
#   gnome-shell-extensions  \
#   gconf-editor    \
#   dconf-editor    \
#   nautilus-open-terminal  \
#   gnome-tweak-tool    \
#   unity-tweak-tool

# disable recursive search (enable type-ahead search) for Nautilus
# gsettings set org.gnome.nautilus.preferences enable-interactive-search true

# remaining manual settings
echo "remaining manual settings"
echo "  * add auto-mount to /etc/fstab (sudo blkid to find uuid), like:"
echo "    \"UUID=4C04-8EBD /disk vfat utf8,umask=007,gid=46 0 1\""
echo "  * install SimSun, SimFang, SimKai, SimHei"
echo "  * system-settings -> language-support"
echo "  * gedit encoding for GB18030"
echo "  * add gnome extension:"
echo "      AlternateTab"
echo "      Alternative Status Menu extension"
echo "      UserTheme"
echo "      DriveMenu"
echo "      Dock"
echo "      No Topleft Hot Corner"
echo "      Remove Dropdown Arrows"
echo "      RemoveAccessibility"
echo "  * install google-chrome"
echo "  * install eclipse"
echo "  * install android-sdk"
echo "  * test graphic dirver (fps > 1700):"
echo "      vblank_mode=0 glxgears"
echo "  * add local dns for google sites"
echo "  * screen saver setting:"
echo "      screen dim in 2min"
echo "      screen saver start in 3min"
echo "      screen lock in 3min"
echo "      screen off in 5min"
