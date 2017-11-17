#!/bin/bash

sudo apt-get update
sudo apt-get install -y aptitude

# font
sudo aptitude install -y ttf-mscorefonts-installer xfonts-wqy fonts-wqy-microhei fonts-wqy-zenhei

# editor
sudo aptitude install -y vim sublime-text

# tool
sudo aptitude install -y gmrun axel rar unrar testdisk p7zip-full privoxy

# dev lib
sudo aptitude install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5-dev lib32z1

# dev tool
sudo aptitude install -y astyle expect git tig
sudo aptitude install -y gcc g++
sudo aptitude install -y openjdk-7-jdk openjdk-7-source
sudo aptitude install -y nodejs npm
sudo npm install -g requirejs underscore backbone
sudo aptitude install -y python python-pip

# ffmpeg
sudo aptitude install -y ffmpeg

