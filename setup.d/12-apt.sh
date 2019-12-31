#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt aptitude

# and small tools
sudo apt-get install -y \
    wget curl axel \
    p7zip-full zip rar unrar \
    ascii testdisk tree
