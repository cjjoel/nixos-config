#!/bin/sh

usage () {
  echo "USAGE: ./emit-config -m <machine> -u <username> -a(optional) <action>"
}

dir="machines"
for f in "$dir"/*; do
  filename=$(basename -- "$f")
  if [ " $filename " != " common.nix " ]; then
    machines+=( "${filename%.*}" )
  fi
done

dir="users"
for f in "$dir"/*; do
  filename=$(basename -- "$f")
  if [ " $filename " != " common.nix " ]; then
    users+=( "${filename%.*}" )
  fi
done

unset USER
unset MACHINE
unset ACTION

while getopts 'u:m:a:' flag; do
  case "${flag}" in
    u) USER=$OPTARG ;;
    m) MACHINE=$OPTARG ;;
    a) ACTION=$OPTARG ;;
    *) usage
       exit 1 ;;
  esac
done

if [[ $# < 4 ]]; then
  echo "Need more arguments"
  echo
  usage
  exit 1
elif [[ ! " ${machines[@]} " =~ " $MACHINE " ]]; then
  echo "Machine not found. Use the following: ${machines[@]}"
  usage
  exit 1
elif [[ ! " ${users[@]} " =~ " $USER " ]]; then
  echo "User not found. Use the following: ${users[@]}"
  usage
  exit 1
fi 

echo "{
  imports = [
    ./machines/$MACHINE.nix
    ./users/$USER.nix
  ];
}" > "configuration.nix"

if [[ "$ACTION" = "switch" ]]; then
  rm -r /etc/nixos/*
  cp -r * /etc/nixos/.
  nixos-rebuild switch
fi

