#!/bin/bash

function adbPullAndRemove() {
    local remote_d="$1"
    f=$(adb shell find "$remote_d" -type f 2>/dev/null | head -n1)
    if test -z "$f"; then
        return
    fi
    echo saw: ["$f"]
    adb pull "$f" .
    f1=$(printf %q "$f")
    adb shell rm "$f1"
}

QQ_FILE_D="/storage/emulated/0/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv"

n="$1"
if test -z "$n"; then
    n=1
fi

for i in $(seq 1 $n); do
    adbPullAndRemove "$QQ_FILE_D"
done
