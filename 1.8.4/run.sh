#!/bin/bash
# maintainer: dwightaspencer@computekindustries.com
#
# run.sh -  loads in either rsa, dsa, or ecdsa keys for ssh

eval `ssh-agent -s` > /dev/null 2>&1

add_keys() {
    SSH_ROOT=${1}

    find ${SSH_ROOT} \( -name \*_rsa -o -name \*_dsa -o -name \*_ecdsa \) -type f |\
        xargs -I{} -- ssh-add ${key} > /dev/null 2>&1
}

[ -d /ssh ] && export SSH_ROOT=/ssh
[ -d ${HOME}/.ssh ] && export SSH_ROOT=/ssh

add_keys $SSH_ROOT

exec "$@"
