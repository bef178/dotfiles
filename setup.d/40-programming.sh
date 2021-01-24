#!/bin/bash

sudo apt-get install -y astyle

# c
sudo apt-get install -y lib32ncurses5-dev lib32z1
sudo apt-get install -y gcc libc6-i386 lib32gcc1

# c++
sudo apt-get install -y g++ lib32stdc++6

# java
sudo apt-get install -y openjdk-8-jdk openjdk-8-source
cat >> $HOME/.bashrc << EOF

# jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
