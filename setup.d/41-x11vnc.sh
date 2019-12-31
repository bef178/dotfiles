#!/bin/bash

sudo apt-get install -y x11vnc
cat >> $HOME/.bashrc << EOF

alias vncs="x11vnc -dontdisconnect -noxfixes -shared -forever -rfbport 5900 -bg -rfbauth \$HOME/.vnc/passwd"
EOF
