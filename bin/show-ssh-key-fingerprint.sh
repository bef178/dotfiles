#!/bin/bash

keyFile="$1"
ssh-keygen -l -E md5 -f "$keyFile"
