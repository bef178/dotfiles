#!/bin/bash

# java
sudo apt-get install -y openjdk-11-jdk openjdk-11-source
cat >> $HOME/.bashrc << EOF

# jdk
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
