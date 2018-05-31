#!/bin/bash

# bashrc sourced by interactive & non-login bash

DROOT="$1"
echo "source \"$DROOT/bashrc\"" >> $HOME/.bashrc
