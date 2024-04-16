#!/bin/bash


if test "$(whoami)" != "ran"; then
  printf "\n";
  printf "ERROR! this script must run as user 'ran'.\n"
  printf "\n";
  printf "* ************************\n";
  printf "* CREATE USER 'ran'       \n";
  printf "*\n";
  printf "* useradd -m ran\n";
  printf "* passwd user ran\n";
  printf "*\n";
  printf "* visudo\n";
  printf "*    ran ALL=(All)   ALL\n";
  printf "*\n";
  printf "* cp -r /root/.ssh /home/ran\n";
  printf "*    chmod 644 /home/ran/.ssh/*\n";
  printf "*\n";
  printf "* ************************\n";
  exit 1
fi


set -e
source ./scripts/script-funcs.sh


function check_command {
  if ! which $1 > /dev/null 2>&1; then
    printf "\e[31m⭑\e[0m command not found: \e[31m%s\e[0m \n" $1
    exit 0
  fi
}

__current_status "installing must-have tools"
must_have_tools=(vim git wget)
for tool in "${must_have_tools[@]}"; do
  __current_status "check ${tool}"
  check_command ${tool}
done


__current_status "linking dotfiles"
dotfiles=(.bashrc .vimrc)
for file in "${dotfiles[@]}"; do
  __current_status "linking ${file}"
  __link_file ~/dotfiles/$file ~/$file
done


source ~/.bashrc
__current_status "installation successful 🚀"

