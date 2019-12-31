#!/bin/bash

cat >> $HOME/.bashrc << EOF

# android sdk
export ANDROID_HOME=\$HOME/app/android-sdk-linux
export PATH=\$PATH:\$ANDROID_HOME/tools:\$ANDROID_HOME/platform-tools
alias ale="adb logcat -d -s *:e"
EOF
