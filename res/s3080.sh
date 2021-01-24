#!/bin/bash

# on s3080 initialize debian 10.9 buster

mount -t iso9660 /dev/sdb1 /media/cdrom

tee /etc/apt/sources.list.d/tuna1.apt.list > /dev/null << EOF
deb     https://mirrors.tuna.tsinghua.edu.cn/debian buster main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian buster main contrib non-free
deb     https://mirrors.tuna.tsinghua.edu.cn/debian buster-updates main contrib non-free
deb     https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
deb     https://mirrors.tuna.tsinghua.edu.cn/debian buster-backports main contrib non-free
EOF

apt-get update

apt-get install vim

# wifi: intel ax200
if false; then
    aptitude install -y -t buster-backports linux-image-amd64 linux-headers-amd64 firmware-iwlwifi
    aptitude install -y wpasupplicant
    tee /etc/network/interfaces.d/wlp3s0 > /dev/null << EOF
allow-hotplug wlp3s0
auto wlp3s0
iface wlp3s0 inet dhcp
wpa-conf /etc/wpa.conf
EOF
    wpa_passphrase "xxx" "freeforall" >> /etc/wpa.conf
    ifup wlp3s0
fi

# with systemd & gnome3, enter text mode by default
if false; then
    sudo systemctl set-default multi-user.target
fi
