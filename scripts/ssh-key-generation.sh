#!/usr/bin/env bash
# script to generate ssh keys if they dont exist

KEYS="github gitlab personal dxw govpress"

for key in $KEYS
do
  KEYPATH=~/.ssh/id_ed25519.$key
  if [ ! -f "$KEYPATH" ]
  then
    echo "$key does not exist"
    echo "Generating $key"
    ssh-keygen -o -a 1024 -t ed25519 -f "$KEYPATH" -C "bob+$key@$HOSTNAME"
  else
    echo "$key does exist"
  fi
done
