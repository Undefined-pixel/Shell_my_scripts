#!/bin/sh
set -xe


set_privat(){
  mv .gitconfig .gitconfig_work
  mv .gitconfig_privat .gitconfig
}

set_work(){
  mv .gitconfig .gitconfig_privat
  mv .gitconfig_work .gitconfig
}

script(){
read -p "git changer (privat/work): " v
if [ "$v" == "privat" ]; then
set_privat
echo "privat"
elif [ "$v" == "work" ]; then
set_work
echo "work"
else
echo "wrong word"
fi
}
main(){
  script
}

main
