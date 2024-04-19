#!/bin/bash

set -e
#set -o xtrace

QQ_FILE_D="/storage/emulated/0/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv"
LOCAL_D="tmp"

function copyRemote() {
    local remoteF="$1"
    local targetF="$2"
    adb pull "$remoteF" "$targetF"
}

function removeRemote() {
    local remoteF="$1"
    adb shell rm \"$remoteF\"
}

f="$1"
copyRemote "$QQ_FILE_D/$f" "$LOCAL_D/" && removeRemote "$QQ_FILE_D/$f"
