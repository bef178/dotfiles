#!/bin/bash
for ((i=0; i<256; i++)); do
    printf "%03d" $i
    printf "\e[38;5;${i}m"
#    printf "%03d" $i
#    printf "\e[0m"
    printf "\e[48;5;${i}m"
    printf "%03d" $i
    printf "\e[0m"
    [ ! $((($i + 1) % 8)) -eq 0 ] && printf " " || printf "\n"
done
printf "\n"
