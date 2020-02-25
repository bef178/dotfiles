#!/bin/bash

declare -a TERM_PALETTE_solarized=(
    "#073642" #0 black
    "#dc322f" #1 red
    "#859900" #2 green
    "#b58900" #3 yellow
    "#268bd2" #4 blue
    "#d33682" #5 magenta
    "#2aa198" #6 cyan
    "#eee8d5" #7 white
    "#002b36" #8 brblack
    "#cb4b16" #9 brred
    "#586e75" #a brgreen
    "#657b83" #b bryellow
    "#839496" #c brblue
    "#6c71c4" #d brmagenta
    "#93a1a1" #e brcyan
    "#fdf6e3" #f brwhite
);

function define16Colors {
    local palette=($*)
    local size=${#palette[*]}
    if test ! $size -eq 16; then
        echo "E: expect 16 colors, acutal [$size]"
        return;
    fi

    for index in ${!palette[*]}; do
        local color=${palette[$index]}

        # define single color
        local r=${color:1:2}
        local g=${color:3:2}
        local b=${color:5:2}
        echo -ne "\x1b]4;$index;rgb:$r/$g/$b\x7"
    done
}

define16Colors ${TERM_PALETTE_solarized[*]}
export LS_COLORS="$LS_COLORS:ow=1;4;34"

unset -f define16Colors
unset -v TERM_PALETTE_solarized
