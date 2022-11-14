#!/bin/bash

# java
sudo apt-get install -y \
    openjdk-8-jdk openjdk-8-source
    openjdk-17-jdk openjdk-17-source

echo >> $HOME/.bashrc
cat >> $HOME/.bashrc << EOF
# jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
