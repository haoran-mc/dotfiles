#!/bin/bash

set -e

function current_status {
  printf "\e[33m⭑\e[0m %s\n" "$1"
}

function link_file {
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

function check_command {
  if ! which $1 > /dev/null 2>&1; then
    printf "command not installed: ", $1
    exit 0
  fi
}

current_status "installing must-have tools"
must_have_tools=(vim)
for tool in "${must_have_tools[@]}"
do
  current_status "check ${tool}"
  check_command ${tool}
done

current_status "linking dotfiles"
dotfiles=(.bashrc .vimrc)

for file in "${dotfiles[@]}"
do
  current_status "linking ${file}"
  rm -f ~/$file
  link_file ~/dotfiles/$file ~/$file
done

source ~/.bashrc

current_status "installation successful 🚀"

