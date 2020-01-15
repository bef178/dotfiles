# source me

function trap_exit_ssh_auth_sock() {
    eval `ssh-agent -s` >/dev/null
    trap "ssh-agent -k" exit
}

function use_fixed_ssh_auth_sock() {
    local sock="/tmp/ssh-agent.$HOSTNAME.sock"
    export SSH_AUTH_SOCK="$sock"
    ssh-add -l 2>/dev/null >/dev/null
    if test $? -ge 2; then
        \rm "$sock" 2>/dev/null
        ssh-agent -a "$sock" >/dev/null
        unset -v SSH_AGENT_PID
    fi
}

function use_ssh_auth_sock() {
    local sock="/tmp/ssh-agent.$HOSTNAME.sock"
    export SSH_AUTH_SOCK="$sock"
    ssh-add -l 2>/dev/null >/dev/null
    if test $? -ge 2; then
        eval `ssh-agent -s` >/dev/null
        unset -v SSH_AGENT_PID
        \ln -snf "$SSH_AUTH_SOCK" "$sock"
        export SSH_AUTH_SOCK="$sock"
    fi
}

#trap_exit_ssh_auth_sock
#use_fixed_ssh_auth_sock
use_ssh_auth_sock

unset -f trap_exit_ssh_auth_sock
unset -f use_fixed_ssh_auth_sock
unset -f use_ssh_auth_sock
