#!/bin/zsh

function zsh_ps1_style2() {
    autoload -U colors && colors
    local time="%{$fg[white]%}%T%{$reset_color%}";
    local host="%{$fg[green]%}%m%{$reset_color%}";
    local wdir="%{$fg[blue]%}%~%{$reset_color%}";
    local user="%{$fg[cyan]%}%n%{$reset_color%}";
    local prompt="%{$fg[white]%}%#%{$reset_color%}";
    case $TERM in
    linux)
        echo "$user@$host:$wdir\n$prompt ";
    ;;
    *-256color)
        echo "$user@$host:$wdir\n$prompt ";
    ;;
    esac
}

PS1=`zsh_ps1_style2`

unset -f zsh_ps1_style2
