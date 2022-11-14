#!/bin/bash

privateKey="$1"
ssh-keygen -y -f "$privateKey"
