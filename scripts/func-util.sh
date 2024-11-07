#!/bin/bash

function __current_status {
    printf "\e[33m⭑\e[0m %s\n" "$1"
    sleep 1
}

function __link_file {
    local src=$1 dst=$2
    local date_str=$(date +%y%m%d%H%M)

    if [ -h "${dst}" ]; then
        printf "info: removing existing symlink: %s\n\n" ${dst}
        rm ${dst}
    elif [ -f "${dst}" ]; then
        printf "info: backing up existing file: %s\n\n" "${dst}"
        mv ${dst}{,.${date_str}}
    elif [ -d "${dst}" ]; then
        printf "info: backing up existing dir: %s\n\n" "${dst}"
        mv ${dst}{,.${date_str}}
    fi

    mkdir -p "$(dirname "${dst}")"
    ln -sf "${src}" "${dst}"
}

function __backup_file {
    local file=$1
    local date_str=$(date +%y%m%d%H%M)

    if [ -h "${file}" ]; then
        printf "info: removing existing symlink: %s\n\n" ${file}
        rm ${file}
    elif [ -f "${file}" ]; then
        printf "info: backing up existing file: %s\n\n" "${file}"
        mv ${file}{,.${date_str}}
    elif [ -d "${file}" ]; then
        printf "info: backing up existing dir: %s\n\n" "${file}"
        mv ${file}{,.${date_str}}
    fi
}

function __install_from_repo {
    local apps=$1

    if [[ `uname` == 'Darwin' ]]; then
        for app in ${apps[@]}; do
            brew install $app
        done
    elif [[ `uname` == 'Linux' ]]; then
        for app in ${apps[@]}; do
            sudo yay -S "$1"
        done
    else
        echo "unsupported os"
    fi
}

# function __install_from_git {
# }
