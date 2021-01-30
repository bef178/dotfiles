#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

cat >> $HOME/.bashrc << EOF

# android sdk
export ANDROID_HOME=\$HOME/app/android-sdk-linux
export PATH=\$PATH:\$ANDROID_HOME/tools:\$ANDROID_HOME/platform-tools
alias ale="adb logcat -d -s *:e"
EOF

sudo ln -snf $TOP/res/51-android.rule -t /etc/udev/rules.d
