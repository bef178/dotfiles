#!/bin/bash

# https://en.wikipedia.org/wiki/ANSI_escape_code
CSI="\x1b["
# SGR=${CSI}${SGR_PARAM}m
ST="\x1b\\"
OSC="\x1b]"

function pr256Color {
    local i="$1"
    printf "\x1b[38;5;${i}m\x1b[48;5;${i}m%03d\x1b[0m" $i
}

function pr256ColorAll {
    printf "256-color\n"
    for ((i=0; i<16; i++)); do
        printf "%3d" $i
        pr256Color $i
        if test ! $((($i + 1) % 8)) -eq 0; then
            printf " "
        else
            printf "\n"
        fi
    done
    for ((i=16; i<232; i++)); do
        printf "%3d" $i
        pr256Color $i
        if test ! $((($i - 16 + 1) % 6)) -eq 0; then
            printf " "
        else
            printf "\n"
        fi
    done
    for ((i=232; i<256; i++)); do
        printf "%3d" $i
        pr256Color $i
        if test ! $((($i - 232 + 1) % 8)) -eq 0; then
            printf " "
        else
            printf "\n"
        fi
    done
}

function pr8ColorAll {
    if test "$1" = "bright"; then
        printf "8-color bright\n"
        local base=90
    else
        printf "8-color\n"
        local base=30
    fi

    printf "%2s "
    for j in $(seq $((base+10)) $((base+17))); do
        printf "%7s " $j
    done
    printf "\n"

    for ((i=$base; i<$((base+8)); i++)); do
        printf "%2s " $i
        for ((j=$((base+10)); j<$((base+18)); j++)); do
            printf "\x1b[$i;${j}m%8s\x1b[0m" "Normal "
        done
        printf "\n"

        printf "%2s "
        for ((j=$((base+10)); j<$((base+18)); j++)); do
            printf "\x1b[$i;1;${j}m%8s\x1b[0m" "Bold "
        done
        printf "\n"
    done
}

function prComparison {
    printf "  8-color"
    for ((i=0; i<8; i++)); do
        printf "\x1b[$((i+30));$((i+40))m%3d\x1b[0m" $i
    done
    for ((i=0; i<8; i++)); do
        printf "\x1b[$((i+90));$((i+100))m%3d\x1b[0m" $i
    done
    printf "\n"
    printf "256-color"
    for ((i=0; i<16; i++)); do
        pr256Color $i
    done
    printf "\n"
}

pr256ColorAll
echo
pr8ColorAll
echo
pr8ColorAll bright
echo
prComparison
echo
